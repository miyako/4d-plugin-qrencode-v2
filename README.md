![version](https://img.shields.io/badge/version-19%2B-5682DF)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-plugin-qrencode-v2)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-plugin-qrencode-v2/total)

# 4d-plugin-qrencode-v2

The `qrencode` plugin generates QR codes from text data and returns them as a **Picture**, driving the open-source [libqrencode](https://fukuchi.org/works/qrencode/) library for the actual symbol encoding and [libpng](http://www.libpng.org/pub/png/libpng.html) for PNG rendering (SVG output is built directly as XML). It exposes two commands: one that returns a single QR symbol, and one that returns a collection of symbols for data that has to be split across multiple linked QR codes ("structured append").

| Command | Returns | Purpose |
|---|---|---|
| [`qrcode`](#qrcode) | Object | Encode text as a single QR (or Micro QR) symbol, as PNG or SVG |
| [`qrcode array`](#qrcode-array) | Collection | Encode text as a structured-append sequence of linked QR symbols |

**Platforms:** macOS and Windows, with identical behavior on both — the plugin's source has no platform-specific branches (the only `#ifdef _WIN32` in the header is a stdio-linkage compatibility shim, not a behavioral difference).

---

## Requirements & platform notes

- Both commands are declared thread-safe in the plugin's manifest, and neither handler holds any shared/global state — safe to call concurrently from multiple 4D processes/threads.
- Parameter 2 (`options`) is entirely optional on both commands. Every option field has a default; if you omit `options` altogether, or omit individual properties, the defaults below apply. Only the recognized property names are read — anything else you put on the object is ignored.
- The result object's `data` property has a **different shape depending on `format`**: base64-encoded PNG bytes as Text when `format` is `QR Format PNG`, but the raw SVG XML source as Text when `format` is `QR Format SVG`. These are not interchangeable — branch on the `format` you requested if you consume `data` directly (most callers just use `image` instead, which is a `Picture` either way).
- **Known limitation:** `QR Mode Swiss` (see below) is only honored by `qrcode`. Tracing `qrcode array`'s handler shows it does not apply the Swiss-specific Latin-1/alphanumeric encoding step that `qrcode` does — if you need Swiss QR-bill output, use `qrcode`, not `qrcode array`.
- **Forward-looking note:** as of this documentation, `margin`, `size`, `dpi`, and `version` are validated and clamped to a bounded range (see the Options object table) before being used. This bounding was added to close a freeze/crash risk where an unbounded `size` or `margin` could drive an arbitrarily large PNG allocation and pixel-writing loop. This is only true of a build made from the currently-reviewed source — an already-installed binary predating this fix will accept these values unbounded.

---

## qrcode

### Syntax

```4d
result:Object := qrcode(text:Text; options:Object)
```

#### Parameters

| Parameter | Type | Description |
|---|---|---|
| `text` | Text | The data to encode. Mandatory — read unconditionally from parameter 1. |
| `options` | Object | Optional. See **Options object** below. If omitted, every field defaults as shown. |
| Result | Object | See **Result object** below. |

#### Options object

| Property | Type | Description |
|---|---|---|
| `level` | Longint | Error-correction level: `QR Correction Level L` (default), `QR Correction Level M`, `QR Correction Level Q`, or `QR Correction Level H`. Out-of-range values fall back to `L`. |
| `mode` | Longint | A **bitmask**, not an exclusive choice — combine flags with `+`. `QR Mode Unicode` (0, default) encodes as UTF-8 8-bit data. `QR Mode Kanji` switches to Shift-JIS/Kanji encoding. `QR Mode Micro` requests a Micro QR symbol instead of a standard one (can combine with Kanji: `QR Mode Kanji+QR Mode Micro`). `QR Mode Swiss` forces Latin‑1 (ISO‑8859‑1) alphanumeric encoding, for the Swiss QR-bill payment standard — see the [worked example](#worked-example-swiss-qr-bill) below. |
| `format` | Longint | `QR Format PNG` (default) or `QR Format SVG`. |
| `margin` | Longint | Quiet-zone width, in modules, around the symbol. Default `0`. Clamped to `0`–`100`. |
| `size` | Longint | Pixel size of one QR module (PNG only — ignored by the SVG path's own scaling, though the same value is still used to compute the SVG's embedded width). Default `3`. Clamped to `1`–`100`. |
| `dpi` | Longint | Resolution metadata embedded in the output (PNG `pHYs` chunk, or a custom `ns4d:DPI` attribute on the SVG root element) — informational only, does not change pixel/module size. Default `72`. Clamped to `1`–`2400`. |
| `version` | Longint | QR symbol version (1–40 for standard QR; Micro QR supports a smaller range internally, enforced by the underlying encoding library). Default `1`. Clamped to `1`–`40` before being passed on; an unsupported version for the requested mode is still rejected by the encoder itself, in which case `qrcode` returns an empty object (see **Error handling** below). |

#### Result object

| Property | Type | Description |
|---|---|---|
| `image` | Picture | The rendered QR code — a raster Picture for `QR Format PNG`, or a Picture built directly from SVG source for `QR Format SVG` (4D can hold SVG data in a Picture). |
| `data` | Text | For PNG: the same image, base64-encoded. For SVG: the raw SVG XML markup as text. |

### Description

`qrcode` reads `text` and, if the caller-supplied `options` sets `mode` to include `QR Mode Kanji`, converts it to Shift-JIS; if `QR Mode Swiss` is set, to Latin‑1 with alphanumeric encoding; otherwise to UTF-8. It then calls into libqrencode's standard or Micro QR encoder (depending on `QR Mode Micro`) and, on success, renders the result as PNG or SVG into the returned object's `image`/`data` properties. If encoding fails for any reason (e.g. the data doesn't fit the requested `version`/correction-level combination), `qrcode` returns an object with neither `image` nor `data` set, rather than raising a 4D error — check for the presence of `image` if you need to detect failure.

### Example

From the plugin's own test method (`TEST.4dm`), encoding Japanese text in Kanji mode:

```4d
C_TEXT:C284($data)
C_PICTURE:C286($picture)

$params:=New object:C1471
$params.dpi:=96
$params.margin:=1
$params.size:=9
$params.version:=1
$params.format:=QR Format PNG
$params.mode:=QR Mode Kanji
$params.level:=QR Correction Level L

$qr:=qrcode ("あいうえお";$params)

WRITE PICTURE FILE:C680(System folder:C487(Desktop:K41:16)+"あいうえお (QR Mode Kanji).png";$qr.image)
```

A minimal call using only defaults (no `options`):

```4d
$qr:=qrcode ("https://example.com")
PICTURE PROPERTIES:C457($qr.image;$width;$height)
```

Requesting SVG instead of PNG, and reading the raw markup:

```4d
$params:=New object:C1471
$params.format:=QR Format SVG
$params.size:=10
$params.margin:=2

$qr:=qrcode ("https://example.com";$params)
TEXT TO DOCUMENT:C1298(Get 4D folder:C485(Current resources folder:K5:16)+"qr.svg";$qr.data)
```

---

## qrcode array

### Syntax

```4d
result:Collection := qrcode array(text:Text; options:Object)
```

#### Parameters

| Parameter | Type | Description |
|---|---|---|
| `text` | Text | The data to encode. Mandatory. |
| `options` | Object | Optional — same **Options object** shape as `qrcode` (above), with the same defaults. Note: `QR Mode Swiss` is **not** honored by this command (see Requirements above). |
| Result | Collection | One element per generated QR symbol (see below). |

#### Result collection

Each element is an Object with the same shape as `qrcode`'s result: `image` (Picture) and `data` (Text, base64-PNG or SVG-XML depending on `format`).

### Description

`qrcode array` uses libqrencode's *structured append* encoding: when `text` is too large to fit a single QR symbol at the requested `version`/correction level, the data is split across multiple linked symbols, each returned as one element of the result collection, in order. If the data fits in one symbol, the collection still contains exactly one element. If encoding fails outright, the returned collection is empty — check `.length` before iterating.

*No sample/test file exercising this command was provided with this review — the example below is built from the same option-object shape verified against `qrcode`'s own test files, not from a dedicated test of `qrcode array` itself.*

### Example

```4d
$params:=New object:C1471
$params.format:=QR Format PNG
$params.size:=6
$params.margin:=2
$params.level:=QR Correction Level M

$parts:=qrcode array (Very long text variable here;$params)

For each ($part;$parts)
	WRITE PICTURE FILE:C680(Folder:C1567(fk desktop folder:K87:19).file("part_"+String:C10($parts.indexOf($part)+1)+".png").platformPath;$part.image)
End for each 
```

---

## Worked example: Swiss QR-bill

`qrcode`'s own test methods build the full Swiss QR-bill payload (a fixed-order, newline-separated set of payment fields per the [Swiss QR-bill standard](https://www.six-group.com/en/products-services/banking-services/payments.html)) and pass it through `qrcode` with `QR Mode Swiss`, then overlay the mandatory Swiss cross. Adapted from `QRCH.4dm`:

```4d
  // $QRCH is an object built earlier with Header, CdtrInf, UltmtCdtr,
  // CcyAmtDate, UltmtDbtr, RmtInf, and AltPmtInf fields per the Swiss
  // QR-bill spec (see TEST_1.4dm / TEST_2.4dm for how $QRCH is assembled)

$code:=OB Get:C1224(OB Get:C1224($QRCH;"Header");"QRType";Is text:K8:3)+"\r\n"
  // ...(remaining fields concatenated in the fixed order the standard requires)...

$params:=New object:C1471
$params.dpi:=96
$params.margin:=0
$params.size:=3
$params.version:=1
$params.format:=QR Format PNG
$params.mode:=QR Mode Swiss
$params.level:=QR Correction Level M

$qr:=qrcode ($code;$params)
$picture:=$qr.image

  // overlay the mandatory Swiss cross at the code's center
READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"CH-Kreuz_7mm.png";$cross)
PICTURE PROPERTIES:C457($cross;$crossSize;$crossSize)
$codeSize:=$crossSize/7*46  // Swiss QR code must render at 46mm
PICTURE PROPERTIES:C457($picture;$qrSize;$qrSize)
TRANSFORM PICTURE:C988($picture;Scale:K61:2;$codeSize/$qrSize;$codeSize/$qrSize)
PICTURE PROPERTIES:C457($picture;$qrSize;$qrSize)
COMBINE PICTURES:C987($picture;$picture;Superimposition:K61:10;$cross;($qrSize/2)-($crossSize/2);($qrSize/2)-($crossSize/2))
```

A related standard — SEPA/EPC QR codes for payments in Austria, Belgium, Finland, Germany, and the Netherlands — is built the same way but with a different field layout, as shown in `TEST_3.4dm`:

```4d
$code:="BCD\n001\n2\nSCT"
$code:=$code+Char:C90(10)+$BIC+Char:C90(10)+$name+Char:C90(10)+$IBAN+Char:C90(10)+"EUR"+String:C10($paymenttotal;"&xml")
$code:=$code+Char:C90(10)+Char:C90(10)+$text+Char:C90(10)+Char:C90(10)

$Barcode_Params_o:=New object:C1471
$Barcode_Params_o.mode:=QR Mode Unicode
$Barcode_Params_o.level:=QR Correction Level M

$Barcode_o:=qrcode ($code;$Barcode_Params_o)
SET PICTURE TO PASTEBOARD:C521($Barcode_o.image)
```

Note this SEPA/EPC example uses `QR Mode Unicode` (plain UTF-8), not `QR Mode Swiss` — the Swiss-specific Latin-1/alphanumeric mode is only for the Swiss QR-bill standard specifically, not QR payment codes generally.

---

## Error handling & troubleshooting

- **No `image`/`data` on the result means encoding failed.** Both commands return a valid Object/Collection even on failure — they don't raise a 4D error. Check for `image` (or the collection's length, for `qrcode array`) rather than assuming success.
- **`data`'s format depends on `format`, not on which command you called.** Base64 PNG text and raw SVG XML text are both plain Text properties — don't assume one and try to decode it as the other.
- **`QR Mode Swiss` only works with `qrcode`, not `qrcode array`.** Passing Swiss QR-bill payloads through `qrcode array` will encode them as plain UTF-8 instead of the required Latin-1/alphanumeric mode.
- **`mode` is additive, not a single choice.** `QR Mode Kanji+QR Mode Micro` is a valid combination (Kanji-encoded Micro QR); passing just one flag when you meant to combine two silently drops the other.
- **Out-of-range `level`/`format` values silently fall back to the default** (`QR Correction Level L` / `QR Format PNG`) rather than erroring.
- **`margin`, `size`, `dpi`, and `version` are silently clamped** to the ranges in the Options object table above, rather than erroring on an out-of-range value — a very large `size` will quietly produce the largest permitted image rather than the one you asked for.

---

## Quick reference

```4d
  // single QR code, defaults only
$qr:=qrcode ("some text")
$picture:=$qr.image

  // single QR code, common options
$params:=New object:C1471
$params.format:=QR Format PNG   // or QR Format SVG
$params.mode:=QR Mode Unicode   // or QR Mode Kanji / QR Mode Swiss / QR Mode Micro (combine with +)
$params.level:=QR Correction Level M
$params.size:=6
$params.margin:=2
$params.dpi:=300
$params.version:=1

$qr:=qrcode ("some text";$params)
SET PICTURE TO PASTEBOARD:C521($qr.image)

  // structured-append (multi-symbol) QR codes
$parts:=qrcode array ("very long text that needs multiple symbols";$params)
For each ($part;$parts)
	SET PICTURE TO PASTEBOARD:C521($part.image)
End for each 
```

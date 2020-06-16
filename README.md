# 4d-plugin-qrencode-v2
QR code generator based on [libqrencode](https://fukuchi.org/works/qrencode/).

### Platform

| carbon | cocoa | win32 | win64 |
|:------:|:-----:|:---------:|:---------:|
||<img src="https://cloud.githubusercontent.com/assets/1725068/22371562/1b091f0a-e4db-11e6-8458-8653954a7cce.png" width="24" height="24" />|<img src="https://cloud.githubusercontent.com/assets/1725068/22371562/1b091f0a-e4db-11e6-8458-8653954a7cce.png" width="24" height="24" />|<img src="https://cloud.githubusercontent.com/assets/1725068/22371562/1b091f0a-e4db-11e6-8458-8653954a7cce.png" width="24" height="24" />|

### Version

<img width="32" height="32" src="https://user-images.githubusercontent.com/1725068/73986501-15964580-4981-11ea-9ac1-73c5cee50aae.png"> <img src="https://user-images.githubusercontent.com/1725068/73987971-db2ea780-4984-11ea-8ada-e25fb9c3cf4e.png" width="32" height="32" />

### Syntax

[miyako.github.io](https://miyako.github.io/2019/10/11/4d-plugin-qrencode.html)

### Usage

```4d
C_OBJECT($Barcode_o;$Barcode_Params_o)

$Barcode_Params_o:=New object
$Barcode_Params_o.dpi:=96
$Barcode_Params_o.margin:=1
$Barcode_Params_o.size:=9
$Barcode_Params_o.version:=1
$Barcode_Params_o.format:=QR Format PNG
$Barcode_Params_o.mode:=QR Mode Latin
$Barcode_Params_o.level:=QR Correction Level L

$Barcode_o:=qrcode ("Foobar";$Barcode_Params_o)

WRITE PICTURE FILE(System folder(Desktop)+"qrcode.png";$Barcode_o.image)
```

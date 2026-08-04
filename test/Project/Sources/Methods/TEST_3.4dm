//%attributes = {}
  // SEPA payment codes, currently useable in Austria, Belgium, Finland, Germany, The Netherlands
  // https://en.wikipedia.org/wiki/EPC_QR_code
  // https://www.stuzza.at/en/download/qr-code/339-qr-code-und-bcd-definition-2-en/file.html

  // example based on https://de.wikipedia.org/wiki/EPC-QR-Code
$BIC:="BFSWDE33BER"  // bank data of receiver
$name:="Wikimedia Foerdergesellschaft"  // avoid diacritics or other special chars, most banks will fail to use them
$IBAN:="DE33100205000001194700"
$paymenttotal:=123.45
$text:="Invoice 1234 from 12.05.2021"  // avoid diacritics or other special chars, most banks will fail to use them

$code:="BCD\n001\n2\nSCT"
$code:=$code+Char:C90(10)+$BIC+Char:C90(10)+$name+Char:C90(10)+$IBAN+Char:C90(10)+"EUR"+String:C10($paymenttotal;"&xml")  // use decimal dot even if local country use comma
$code:=$code+Char:C90(10)+Char:C90(10)+$text+Char:C90(10)+Char:C90(10)

$Barcode_Params_o:=New object:C1471
$Barcode_Params_o.dpi:=96
$Barcode_Params_o.margin:=1
$Barcode_Params_o.size:=9
$Barcode_Params_o.version:=1
$Barcode_Params_o.format:=QR Format PNG  // highlighting seems to be wrong here – these are constants
$Barcode_Params_o.mode:=QR Mode Unicode
$Barcode_Params_o.level:=QR Correction Level M

$Barcode_o:=qrcode ($code;$Barcode_Params_o)


SET PICTURE TO PASTEBOARD:C521($Barcode_o.image)
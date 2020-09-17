//%attributes = {}
C_OBJECT:C1216($Barcode_o;$Barcode_Params_o)

$Barcode_Params_o:=New object:C1471
$Barcode_Params_o.dpi:=96
$Barcode_Params_o.margin:=1
$Barcode_Params_o.size:=9
$Barcode_Params_o.version:=1
$Barcode_Params_o.format:=QR Format PNG  // highlighting seems to be wrong here – these are constants
$Barcode_Params_o.mode:=QR Mode Unicode
$Barcode_Params_o.level:=QR Correction Level L

$Barcode_o:=qrcode ("Foobar";$Barcode_Params_o)


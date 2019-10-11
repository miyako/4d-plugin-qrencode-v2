//%attributes = {}
C_TEXT:C284($data)
C_PICTURE:C286($picture)

$params:=New object:C1471
$params.dpi:=96
$params.margin:=1
$params.size:=9
$params.version:=1
$params.format:=QR Format PNG
$params.mode:=QR Mode Unicode
$params.level:=QR Correction Level L

$qr:=qrcode ("www.wakanda.org";$params)

WRITE PICTURE FILE:C680(System folder:C487(Desktop:K41:16)+"qr-test.png";$qr.image)


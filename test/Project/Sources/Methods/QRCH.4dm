//%attributes = {}
C_OBJECT:C1216($1;$QRCH)
C_PICTURE:C286($0)

$QRCH:=$1

$code:=""
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"Header");"QRType";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"Header");"Version";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"Header");"Coding";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"IBAN";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"Name";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"StrtNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"BldgNb";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"PstCd";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"TwnNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"Ctry";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"Name";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"StrtNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"BldgNb";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"PstCd";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"TwnNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"Ctry";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CcyAmtDate");"Amt";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CcyAmtDate");"Ccy";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CcyAmtDate");"ReqdExctnDt";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"Name";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"StrtNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"BldgNb";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"PstCd";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"TwnNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"Ctry";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"RmtInf");"Tp";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"RmtInf");"Ref";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"RmtInf");"Ustrd";Is text:K8:3)

ARRAY TEXT:C222($AltPmt;0)
OB GET ARRAY:C1229($QRCH;"AltPmtInf";$AltPmt)
If (Size of array:C274($AltPmt)#0)
	$code:=$code+"\r\n"+$AltPmt{1}
End if 
If (Size of array:C274($AltPmt)>1)
	$code:=$code+"\r\n"+$AltPmt{2}
End if 

C_OBJECT:C1216($1;$QRCH)
C_PICTURE:C286($0)

$QRCH:=$1

$code:=""
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"Header");"QRType";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"Header");"Version";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"Header");"Coding";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"IBAN";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"Name";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"StrtNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"BldgNb";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"PstCd";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"TwnNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224(OB Get:C1224($QRCH;"CdtrInf");"Cdtr");"Ctry";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"Name";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"StrtNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"BldgNb";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"PstCd";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"TwnNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtCdtr");"Ctry";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CcyAmtDate");"Amt";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CcyAmtDate");"Ccy";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"CcyAmtDate");"ReqdExctnDt";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"Name";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"StrtNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"BldgNb";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"PstCd";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"TwnNm";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"UltmtDbtr");"Ctry";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"RmtInf");"Tp";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"RmtInf");"Ref";Is text:K8:3)+"\r\n"
$code:=$code+OB Get:C1224(OB Get:C1224($QRCH;"RmtInf");"Ustrd";Is text:K8:3)

ARRAY TEXT:C222($AltPmt;0)
OB GET ARRAY:C1229($QRCH;"AltPmtInf";$AltPmt)
If (Size of array:C274($AltPmt)#0)
	$code:=$code+"\r\n"+$AltPmt{1}
End if 
If (Size of array:C274($AltPmt)>1)
	$code:=$code+"\r\n"+$AltPmt{2}
End if 

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

READ PICTURE FILE:C678(Get 4D folder:C485(Current resources folder:K5:16)+"CH-Kreuz_7mm.png";$cross)
PICTURE PROPERTIES:C457($cross;$crossSize;$crossSize)  //166
$codeSize:=$crossSize/7*46  //Swiss QR code should be 46mm
PICTURE PROPERTIES:C457($picture;$qrSize;$qrSize)
TRANSFORM PICTURE:C988($picture;Scale:K61:2;$codeSize/$qrSize;$codeSize/$qrSize)
PICTURE PROPERTIES:C457($picture;$qrSize;$qrSize)
COMBINE PICTURES:C987($picture;$picture;Superimposition:K61:10;$cross;($qrSize/2)-($crossSize/2);($qrSize/2)-($crossSize/2))

$0:=$picture
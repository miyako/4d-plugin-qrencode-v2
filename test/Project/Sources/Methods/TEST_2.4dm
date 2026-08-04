//%attributes = {}
C_OBJECT:C1216($Header)
OB SET:C1220($Header;\
"QRType";"SPC";\
"Version";"0100";\
"Coding";"1")

  //Konto
$IBAN:="CH4431999123000889012"

  //ZE
$Name:="Robert Schneider AG"
$StrtNm:="Rue du Lac"
$BldgNb:="1268"
$PstCd:="2501"
$TwnNm:="Biel"
$Ctry:="CH"

ASSERT:C1129(Match regex:C1019("[a-zA-Z]{2}[0-9]{2}[a-zA-Z0-9]{4}[0-9]{7}[a-zA-Z0-9]{0,16}";$IBAN))
ASSERT:C1129(Length:C16($Name)<71)
ASSERT:C1129(Length:C16($StrtNm)<71)
ASSERT:C1129(Length:C16($BldgNb)<17)
ASSERT:C1129(Length:C16($PstCd)<17)
ASSERT:C1129(Length:C16($TwnNm)<36)
ASSERT:C1129(Match regex:C1019("[a-zA-Z]{2}";$Ctry))

C_OBJECT:C1216($Cdtr)
OB SET:C1220($Cdtr;\
"Name";$Name;\
"StrtNm";$StrtNm;\
"BldgNb";$BldgNb;\
"PstCd";$PstCd;\
"TwnNm";$TwnNm;\
"Ctry";Uppercase:C13($Ctry))

C_OBJECT:C1216($CdtrInf)
OB SET:C1220($CdtrInf;\
"IBAN";Uppercase:C13($IBAN);\
"Cdtr";$Cdtr)

$Name:="Robert Schneider Services Switzerland AG"

  //EZE
C_OBJECT:C1216($UltmtCdtr)
OB SET:C1220($UltmtCdtr;\
"Name";$Name;\
"StrtNm";$StrtNm;\
"BldgNb";$BldgNb;\
"PstCd";$PstCd;\
"TwnNm";$TwnNm;\
"Ctry";Uppercase:C13($Ctry))

$Amt:="1949.75"
$Ccy:="CHF"
$ReqdExctnDt:="2019-10-31"

C_OBJECT:C1216($CcyAmtDate)
OB SET:C1220($CcyAmtDate;\
"Amt";$Amt;\
"Ccy";$Ccy;\
"ReqdExctnDt";$ReqdExctnDt)

  //EZP
$Name:="Pia-Maria Rutschmann-Schnyder"
$StrtNm:="Grosse Marktgasse"
$BldgNb:="28"
$PstCd:="9400"
$TwnNm:="Rorschach"
$Ctry:="CH"

C_OBJECT:C1216($UltmtDbtr)
OB SET:C1220($UltmtDbtr;\
"Name";$Name;\
"StrtNm";$StrtNm;\
"BldgNb";$BldgNb;\
"PstCd";$PstCd;\
"TwnNm";$TwnNm;\
"Ctry";$Ctry)

$Tp:="QRR"
$Ref:="210000000003139471430009017"
$Ustrd:="Auftrag vom 15.09.2019##S1/01/20170309/11/10201409/20/14000000/22/36958/30/CH106017086/40/1020/41/3010"

C_OBJECT:C1216($RmtInf)
OB SET:C1220($RmtInf;\
"Tp";$Tp;\
"Ref";$Ref;\
"Ustrd";$Ustrd)

ARRAY TEXT:C222($AltPmt;2)
$AltPmt{1}:="UV1;1.1;1278564;1A-2F-43-AC-9B-33-21-B0-CC-D4-28-56;TCXVMKC22;2019-02-10T15:12:39; 2019-02-10T15:18:16"
$AltPmt{2}:="XY2;2a-2.2r;_R1-CH2_ConradCH-2074-1_3350_2019-03-13T10:23:47_16,99_0,00_0,00_0,00_0,00_+8FADt/DQ=_1=="

C_OBJECT:C1216($QRCH)
OB SET:C1220($QRCH;\
"Header";$Header;\
"CdtrInf";$CdtrInf;\
"UltmtCdtr";$UltmtCdtr;\
"CcyAmtDate";$CcyAmtDate;\
"UltmtDbtr";$UltmtDbtr;\
"RmtInf";$RmtInf)
OB SET ARRAY:C1227($QRCH;"AltPmtInf";$AltPmt)

$picture:=QRCH ($QRCH)

SET PICTURE TO PASTEBOARD:C521($picture)
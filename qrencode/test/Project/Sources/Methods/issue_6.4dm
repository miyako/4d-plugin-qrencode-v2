//%attributes = {"preemptive":"incapable"}
var $TEST : cs:C1710.Table_1Entity
$TEST:=ds:C1482.Table_1.new()

var $qrcode : Picture
$qrcode:=$TEST.getCaseQRCode()

INVOKE ACTION:C1439(ak show clipboard:K76:58)
SET PICTURE TO PASTEBOARD:C521($qrcode)
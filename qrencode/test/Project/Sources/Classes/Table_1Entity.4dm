Class extends Entity

Class constructor
	
	This:C1470.NewCase_ID:=Generate UUID:C1066
	
	// Returns a QR code for the passed case
exposed Function getCaseQRCode()->$qrCodeImage : Picture
	
	var $version : Integer
	var $size : Integer
	var $margin : Integer
	var $dpi : Integer
	var $barcode : Object
	var $params : Object
	var $image : Picture
	
	$version:=2
	$size:=64
	$margin:=1
	$dpi:=96
	
	$barcode:=New object:C1471
	$params:=New object:C1471
	$params.dpi:=$dpi
	$params.margin:=$margin
	$params.size:=$size
	$params.version:=$version
	$params.format:=QR Format SVG
	$params.mode:=QR Mode Unicode
	$params.level:=QR Correction Level H  // Up to 30% damage
	
	$barcode:=qrcode(This:C1470.NewCase_ID; $params)
	$qrCodeImage:=$barcode.image
	
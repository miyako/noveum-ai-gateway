//%attributes = {"invisible":true}
var $GatewayAI : cs:C1710.server
$GatewayAI:=cs:C1710.server.new()

$isRunning:=$GatewayAI.isRunning()

$GatewayAI.start({port: 8080})
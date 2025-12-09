var $GatewayAI : cs:C1710.server
$GatewayAI:=cs:C1710.server.new()
$GatewayAI.start({port: 8080})
$isRunning:=$GatewayAI.isRunning()
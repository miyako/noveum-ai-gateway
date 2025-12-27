var $GatewayAI : cs:C1710.GatewayAI

If (False:C215)
	$GatewayAI:=cs:C1710.GatewayAI.new()  //default
Else 
	
	var $port : Integer
	$port:=8080
	
	var $event : cs:C1710.event.event
	$event:=cs:C1710.event.event.new()
/*
Function onError($params : Object; $error : cs.event.error)
Function onSuccess($params : Object; $models : cs.event.models)
Function onTerminate($worker : 4D.SystemWorker; $params : Object)
*/
	
	$event.onError:=Formula:C1597(ALERT:C41($2.message))
	$event.onSuccess:=Formula:C1597(ALERT:C41($2.models.extract("name").join(",")+" started!"))
	$event.onTerminate:=Formula:C1597(LOG EVENT:C667(Into 4D debug message:K38:5; (["process"; $1.pid; "terminated!"].join(" "))))
	
	var $options : Object
	$options:={}
	
/*
# Or with custom port
PORT=8080 noveum-ai-gateway
*/
	$GatewayAI:=cs:C1710.GatewayAI.new($port; $options; $event)
End if 
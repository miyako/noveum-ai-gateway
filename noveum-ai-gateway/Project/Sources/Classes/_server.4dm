Class extends _GatewayAI

Class constructor($controller : 4D:C1709.Class)
	
	Super:C1705($controller)
	
Function start($option : Object) : 4D:C1709.SystemWorker
	
	var $command : Text
	$command:=This:C1470.escape(This:C1470.executablePath)
	
	If (Value type:C1509($option.port)=Is real:K8:4) && ($option.port>0)
		This:C1470.controller.variables.PORT:=String:C10($option.port)
	End if 
	
	return This:C1470.controller.execute($command; Null:C1517; $option.data).worker
Class constructor($port : Integer; $options : Object; $event : cs:C1710.event.event)
	
	var $GatewayAI : cs:C1710.workers.worker
	$GatewayAI:=cs:C1710.workers.worker.new()
	
	If (Not:C34($GatewayAI.isRunning($port)))
		
		If ($port=0) || ($port<0) || ($port>65535)
			$port:=8080
		End if 
		
		This:C1470._main($port; $options; $event)
		
	End if 
	
Function _onTCP($status : Object; $options : Object)
	
	If ($status.success)
		
		var $className : Text
		$className:=Split string:C1554(Current method name:C684; "."; sk trim spaces:K86:2).first()
		
		CALL WORKER:C1389($className; Formula:C1597(start); $options; Formula:C1597(onModel))
		
	Else 
		
		var $statuses : Text
		$statuses:="TCP port "+String:C10($status.port)+" is aready used by process "+$status.PID.join(",")
		var $error : cs:C1710.event.error
		$error:=cs:C1710.event.error.new(1; $statuses)
		
		If ($options.event#Null:C1517) && (OB Instance of:C1731($options.event; cs:C1710.event.event))
			$options.event.onError.call(This:C1470; $options; $error)
		End if 
		
	End if 
	
Function _main($port : Integer; $options : Object; $event : cs:C1710.event.event)
	
	main({port: $port; event: $event; options: $options}; This:C1470._onTCP)
	
Function terminate()
	
	var $CTranslate2 : cs:C1710.workers.worker
	$CTranslate2:=cs:C1710.workers.worker.new(cs:C1710._server)
	$CTranslate2.terminate()
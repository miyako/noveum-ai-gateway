![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/noveum-ai-gateway)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/noveum-ai-gateway/total)

# noveum-ai-gateway
[AI Gateway proxy](https://github.com/noveum/ai-gateway)

## usage

```4d
var $GatewayAI : cs.server
$GatewayAI:=cs.server.new()

$isRunning:=$GatewayAI.isRunning()

$GatewayAI.start({port: 8080})
```

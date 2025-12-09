---
layout: default
---

![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm%20|%20win-64&color=blue)
[![license](https://img.shields.io/github/license/miyako/noveum-ai-gateway)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/noveum-ai-gateway/total)

# Use Noveum AI Gateway from 4D

#### Abstract

[**Noveum AI Gateway**](https://github.com/noveum/ai-gateway) is a proxy server that routes local HTTP requests to various AI providers.

#### Usage

Instantiate `cs.GatewayAI.server` in your *On Startup* database method:

```4d
var $GatewayAI : cs.GatewayAI.server
$GatewayAI:=cs.GatewayAI.server.new()
$GatewayAI.start({port: 8080})
```

Unless the server is already running (in which case the costructor does nothing), the following procedure runs in the background:

1. The specified model is download via HTTP
2. The `noveum-ai` program is started

Now you can test the server:

```
curl -X POST http://127.0.0.1:8080/v1/chat/completions \
     -H "Content-Type: application/json" \
     -H "x-provider: openai" \
     -H "Authorization: Bearer your-openai-api-key" \
     -d '{
        "model": "gpt-4",
        "messages": [{"role": "user", "content": "Hello!"}]
    }'
```

Or, use AI Kit:

```4d
var $AIClient : cs.AIKit.OpenAI
$AIClient:=cs.AIKit.OpenAI.new({apiKey: "your-openai-api-key"})
$AIClient.baseURL:="http://127.0.0.1:8080/v1"
$AIClient.customHeaders:={}
$AIClient.customHeaders["x-provider"]:="openai"

var $messages : Collection
$messages:=[{role: "user"; content: "Hello!"}]

var $ChatCompletionsParameters : cs.AIKit.OpenAIChatCompletionsParameters
$ChatCompletionsParameters:=cs.AIKit.OpenAIChatCompletionsParameters.new()
$ChatCompletionsParameters.model:="gpt-4"
$ChatCompletionsParameters.stream:=False

var $chatCompletionsResult : cs.AIKit.OpenAIChatCompletionsResult
$chatCompletionsResult:=$AIClient.chat.completions.create($messages)
```

Finally to terminate the server:

```4d
var $GatewayAI : cs.GatewayAI.server
$GatewayAI:=cs.GatewayAI.server.new()
$GatewayAI.terminate()
```

#### AI Kit compatibility

The API is compatibile with [Open AI](https://platform.openai.com/docs/api-reference/embeddings). 

|Class|API|Availability|
|-|-|:-:|
|Models|`/v1/models`|✅|
|Chat|`/v1/chat/completions`|✅|
|Images|`/v1/images/generations`|✅|
|Moderations|`/v1/moderations`|✅|
|Embeddings|`/v1/embeddings`|✅|
|Files|`/v1/files`|✅|

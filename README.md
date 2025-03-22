# My Ollama

An Ollama server I use for local experiments and small Proofs of Concept (POCs).
It is automatically built, downloads a Mistral model, and allows API interactions.

## Requirements
1. Docker
2. Make
  
## How to use  
1. Clone the project repository.
2. Start the server using the `make` command.
```bash
make start
```
3. Once the server is running, you can interact with the API using the following command, which will send a "Hello, World!" request.
```bash
make test
```
4. If you visit `http://localhost:11434/`, you will see the message: "Ollama is running."
   Here’s the improved version of your text:

---

- The command will build the image, and the Mistral model will be downloaded during the first startup.
- The initial run will take longer since the Mistral model is approximately 4 GiB in size.

---

## Want more models? 

Simply add or update the `ollama/entrypoint.sh` file to pull all the models you need.

### Useful information

Request Payload format without streaming:
```json
{
	"model": "mistral",
	"messages": [{"role": "user", "content": "Hey, hello"}],
	"stream": false
}

```

curl request command example
```bash
curl -X POST http://localhost:11434/api/chat \
		-H "Content-Type: application/json" \
		-d '{"model":"mistral","messages":[{"role":"user","content":"Hey, hello"}],"stream":false}'

```

Response format (stream off):
```json
{
  "model": "mistral",
  "created_at": "2025-03-22T11:18:44.390931329Z",
  "message": {
    "role": "assistant",
    "content": "Hi there! How can I help you today?"
  },
  "done_reason": "stop",
  "done": true,
  "total_duration": 6333487103,
  "load_duration": 4574464627,
  "prompt_eval_count": 13,
  "prompt_eval_duration": 652533937,
  "eval_count": 11,
  "eval_duration": 1096839380
}
```
 

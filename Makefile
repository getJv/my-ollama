build_ollama:
	@echo "Building ollama-server with entrypoint script"
	cd ollama && docker build -f ./ollama.dockerfile -t  getjv/ollama-mistral .
	@echo "Done!"

up:
	@echo "Starting... ollama-server first execution will download the model please wait..."
	docker compose up --build

open:
	@echo "Accessing container ollama-server"
	docker exec -it ollama-server bash

JSON_PAYLOAD = "{\"model\":\"mistral\",\"messages\":[{\"role\":\"user\",\"content\":\"Hello, just say hi to me.\"}],\"stream\":false}"

test:
	@echo "testing api..."
	curl -X POST http://localhost:11434/api/chat \
		-H "Content-Type: application/json" \
		-d $(JSON_PAYLOAD)



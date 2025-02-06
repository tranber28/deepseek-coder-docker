FROM ubuntu:latest

WORKDIR /app

RUN apt update && apt install -y curl

RUN curl -fsSL https://ollama.ai/install.sh | sh

RUN ollama serve & \
    sleep 5 && \
    ollama pull deepseek-r1:1.5b

COPY entrypoint.sh /app/entrypoint.sh

RUN chmod +x /app/entrypoint.sh

CMD ["/bin/bash", "/app/entrypoint.sh"]

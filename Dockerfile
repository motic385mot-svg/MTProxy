FROM debian:bullseye-slim

# Устанавливаем зависимости
RUN apt-get update && \
    apt-get install -y build-essential git libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Клонируем MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /MTProxy

WORKDIR /MTProxy

# Сборка
RUN make

# Копируем конфиг
COPY proxy-config.conf /MTProxy/proxy-config.conf

# Запуск
CMD ["./objs/bin/mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "8888", "--aes-pwd", "proxy-config.conf", "--verbosity", "2"]

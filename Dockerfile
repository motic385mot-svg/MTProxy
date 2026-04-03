# Берём минимальный Debian
FROM debian:bullseye-slim

# Устанавливаем сборку
RUN apt-get update && \
    apt-get install -y build-essential git libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Клонируем MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /MTProxy

# Копируем конфиг и скрипт
COPY proxy-config.conf /MTProxy/proxy-config.conf
COPY start.sh /MTProxy/start.sh

# Делаем скрипт исполняемым
RUN chmod +x /MTProxy/start.sh /MTProxy/mtproto-proxy

# Указываем рабочую директорию
WORKDIR /MTProxy

# Точка входа
ENTRYPOINT ["./start.sh"]

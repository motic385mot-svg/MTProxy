# Используем минимальный Debian
FROM debian:bullseye-slim

# Устанавливаем инструменты для сборки
RUN apt-get update && \
    apt-get install -y build-essential git libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Клонируем MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /MTProxy

# Устанавливаем рабочую директорию
WORKDIR /MTProxy

# Сборка MTProxy (создает ./mtproto-proxy)
RUN make

# Копируем конфиг и скрипт (можно менять без пересборки)
COPY proxy-config.conf /MTProxy/proxy-config.conf
COPY start.sh /MTProxy/start.sh

# Делаем скрипт исполняемым
RUN chmod +x /MTProxy/start.sh

# Точка входа
ENTRYPOINT ["./start.sh"]

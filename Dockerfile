# Берём минимальный образ Debian
FROM debian:bullseye-slim

# Устанавливаем всё для сборки
RUN apt-get update && \
    apt-get install -y build-essential git libssl-dev zlib1g-dev && \
    rm -rf /var/lib/apt/lists/*

# Клонируем репозиторий MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /MTProxy

WORKDIR /MTProxy

# Сборка бинаря
RUN make

# Копируем конфиг и скрипт
COPY proxy-config.conf /MTProxy/proxy-config.conf
COPY start.sh /MTProxy/start.sh

# Делаем скрипт исполняемым
RUN chmod +x /MTProxy/start.sh

# Старт
ENTRYPOINT ["./start.sh"]

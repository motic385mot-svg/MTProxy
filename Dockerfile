FROM ubuntu:22.04

# Устанавливаем зависимости
RUN apt update && apt install -y build-essential git curl

# Клонируем MTProxy
RUN git clone https://github.com/TelegramMessenger/MTProxy.git /MTProxy

# Компилируем
WORKDIR /MTProxy
RUN make

# Копируем конфиг и скрипт
COPY proxy-config.conf start.sh ./

# Делаем скрипт и бинарник исполняемыми
RUN chmod +x mtproto-proxy start.sh

# Старт
CMD ["./start.sh"]

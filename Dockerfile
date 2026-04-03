# Используем официальный образ MTProxy
FROM telegrammessenger/mtproxy:latest

# Копируем конфиг (если хочешь хранить в репо)
COPY proxy-config.conf /etc/proxy-config.conf

# Указываем команду запуска
CMD ["mtproto-proxy", "-u", "nobody", "-p", "8888", "-H", "8888", "--aes-pwd", "/etc/proxy-config.conf", "--verbosity", "2"]

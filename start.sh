#!/bin/bash
# Берём путь к папке, где лежат скрипт и бинарник
DIR="$(dirname "$0")"

# Запуск MTProxy с абсолютным указанием конфига
"$DIR/mtproto-proxy" -u nobody -p 8888 -H 8888 --aes-pwd "$DIR/proxy-config.conf" --verbosity 2

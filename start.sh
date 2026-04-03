#!/bin/bash

# Запускаем mtproto-proxy из текущей папки
./mtproto-proxy \
    -u nobody \
    -p 8888 \
    -H 8888 \
    --aes-pwd ./proxy-config.conf \
    --verbosity 2
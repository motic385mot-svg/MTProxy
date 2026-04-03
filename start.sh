#!/bin/bash
# Переменные берём из Railway Environment
./mtproto-proxy -u nobody -p $PORT -H $PORT -S $MT_SECRET --aes-pwd proxy-secret proxy-multi.conf

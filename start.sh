#!/bin/bash
DIR="$(dirname "$0")"
"$DIR/mtproto-proxy" -u nobody -p 8888 -H 8888 --aes-pwd "$DIR/proxy-config.conf" --verbosity 2

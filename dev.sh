#!/usr/bin/env sh

nvim_config_path="$HOME/.config/nvim"
[ ! -d "$nvim_config_path" ] && mkdir -p $nvim_config_path && echo "Created nvim config dir".

rm -rf $nvim_config_path
ln -s $(pwd) $nvim_config_path


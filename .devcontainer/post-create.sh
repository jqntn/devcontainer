#!/usr/bin/env bash
set -euo pipefail

apt-get update -qq
apt-get install -y -qq --no-install-recommends git curl fd-find ripgrep

curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz \
  | tar -C /opt -xzf -
ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

pip install --no-cache-dir -e ".[dev]"

apt-get clean
rm -rf /var/lib/apt/lists/*

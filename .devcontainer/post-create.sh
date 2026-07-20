#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update -qq
sudo apt-get install -y -qq --no-install-recommends fd-find ripgrep

sudo chown -R vscode:vscode /home/vscode/.local /home/vscode/.cache

pip install --user -e ".[dev]"

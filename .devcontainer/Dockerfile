FROM python:3.14-slim-trixie

RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl fd-find ripgrep \
    && curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.tar.gz \
       | tar -C /opt -xzf - \
    && ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

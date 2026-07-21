# devcontainer

Sample Python devcontainer project, set up for a LazyVim workflow.

## What's inside

- `.devcontainer/` — `python:3.14-slim-trixie` image (Debian version pinned; runs as root, no sudo needed); Neovim (stable) is installed from the official tarball in `post-create.sh`, so the image stays lean with no devcontainer features
- `src/sample_app/` — small CLI package (`sample-app <n>` prints FizzBuzz)
- `tests/` — pytest suite
- `pyproject.toml` — packaging, pytest, and the `ruff` + `ty` dev tools

Type checking uses [ty](https://github.com/astral-sh/ty) (Astral's Rust type checker) instead of pyright, so no Node runtime is needed. That LSP wiring lives in your Neovim config (`lua/plugins/python-ty.lua`), guarded on `ty` being installed, so it only takes effect where ty is present (i.e. inside this container).

The devcontainer bind-mounts your local Neovim config (`%LOCALAPPDATA%\nvim` on Windows) into the container at `/root/.config/nvim`, so LazyVim runs inside with your exact setup. Plugin data, state, and cache live in named volumes, so plugins install once per container and survive rebuilds without touching your host. On Linux/macOS/WSL, change the first mount source to `${localEnv:HOME}/.config/nvim` in [devcontainer.json](.devcontainer/devcontainer.json).

## Usage

Requires Docker and the [devcontainer CLI](https://github.com/devcontainers/cli) (`npm install -g @devcontainers/cli`). Run commands from the project root, or add `--workspace-folder <path>`.

```sh
devcontainer up
devcontainer exec nvim
```

First `nvim` launch inside the container installs LazyVim plugins into the container volume; let `:Lazy` finish. With the Python extra enabled (`:LazyExtras` → `lang.python`), `ruff` handles linting/formatting and `ty` handles type checking — both are Rust binaries installed via pip, so no Node/Mason download is involved. `lua/plugins/python-ty.lua` in your Neovim config wires ty in and disables pyright.

Run the app and tests from a container shell (`devcontainer exec bash`) or straight from the host:

```sh
devcontainer exec sample-app 15
devcontainer exec pytest
devcontainer exec ruff check .
```

The package is installed editable by `post-create.sh`, so source edits are picked up immediately.

## VS Code

Also works with the Dev Containers extension: "Dev Containers: Reopen in Container".

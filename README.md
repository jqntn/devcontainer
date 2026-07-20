# devcontainer

Sample Python devcontainer project, set up for a LazyVim workflow.

## What's inside

- `.devcontainer/` — Python 3.14 image with Node (for Mason-installed LSPs) and Neovim (stable, built in the container)
- `src/sample_app/` — small CLI package (`sample-app <n>` prints FizzBuzz)
- `tests/` — pytest suite
- `pyproject.toml` — packaging, pytest and ruff config

The devcontainer bind-mounts your local Neovim config (`%LOCALAPPDATA%\nvim` on Windows) into the container, so LazyVim runs inside with your exact setup. Plugin data, state, and cache live in named volumes, so plugins install once per container and survive rebuilds without touching your host. On Linux/macOS/WSL, change the first mount source to `${localEnv:HOME}/.config/nvim` in [devcontainer.json](.devcontainer/devcontainer.json).

## Usage

Requires Docker and the [devcontainer CLI](https://github.com/devcontainers/cli) (`npm install -g @devcontainers/cli`). Run commands from the project root, or add `--workspace-folder <path>`.

```sh
devcontainer up
devcontainer exec nvim
```

First `nvim` launch inside the container installs LazyVim plugins into the container volume; let `:Lazy` finish, and Mason will pull `pyright`/`ruff` if you have the Python extra enabled (`:LazyExtras` → `lang.python`).

Run the app and tests from a container shell (`devcontainer exec bash`) or straight from the host:

```sh
devcontainer exec sample-app 15
devcontainer exec pytest
devcontainer exec ruff check .
```

The package is installed editable by `post-create.sh`, so source edits are picked up immediately.

## VS Code

Also works with the Dev Containers extension: "Dev Containers: Reopen in Container".

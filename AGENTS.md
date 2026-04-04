# Repository Guidelines

## Project Structure & Module Organization
This repository is a Neovim configuration rooted in [init.lua](/home/denis/.config/nvim/init.lua). Core Kickstart modules live under [lua/kickstart](/home/denis/.config/nvim/lua/kickstart), with plugin specs in [lua/kickstart/plugins](/home/denis/.config/nvim/lua/kickstart/plugins). Local overrides and personal additions belong in [lua/custom/plugins](/home/denis/.config/nvim/lua/custom/plugins). User documentation is in [README.md](/home/denis/.config/nvim/README.md) and [doc/kickstart.txt](/home/denis/.config/nvim/doc/kickstart.txt). CI and review templates are under [`.github/`](/home/denis/.config/nvim/.github).

## Build, Test, and Development Commands
Use Neovim itself as the primary runtime:

- `nvim` starts the config and triggers plugin installation through Lazy on first launch.
- `nvim --headless "+Lazy! sync" +qa` installs or updates plugins without opening the UI.
- `nvim --headless "+checkhealth" +qa` runs built-in health checks for providers, tools, and plugin requirements.
- `stylua --check .` matches the CI formatting check in [`.github/workflows/stylua.yml`](/home/denis/.config/nvim/.github/workflows/stylua.yml).
- `stylua init.lua lua` rewrites Lua files to the project style before committing.

## Coding Style & Naming Conventions
Lua formatting is enforced by [`.stylua.toml`](/home/denis/.config/nvim/.stylua.toml): 2-space indentation, Unix line endings, max width 160, and preferred single quotes when possible. Keep plugin specs as small Lua modules returning a `LazySpec`, following filenames such as `debug.lua`, `lint.lua`, or `neo-tree.lua`. Put reusable shared behavior in `lua/kickstart`, and keep fork-specific customizations in `lua/custom`.

## Testing Guidelines
There is no dedicated automated test suite in this fork. Treat formatting and startup as the baseline checks: run `stylua --check .`, launch `nvim`, and verify `:checkhealth` reports no new issues. For plugin changes, test the affected command or keymap interactively and include the exact scenario in your PR notes.

## Commit & Pull Request Guidelines
Recent commits use short imperative subjects, for example `Enable Pyright` and `Add Neotree plugin`. Keep commits focused and descriptive. Pull requests should explain what changed, why it changed, and any manual verification performed. If behavior or UI changes inside Neovim are visible, include screenshots or a short demo clip. Confirm the target repository before opening a PR from a fork, as noted in [`.github/pull_request_template.md`](/home/denis/.config/nvim/.github/pull_request_template.md).

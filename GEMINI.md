# Agent Instructions for `agc` (AntiGravity/GeminiCLI Tool)

`agc` is a public Ruby CLI that unifies discovery, inspection, and management of agent customizations across multiple surfaces and entities.

## Architecture & Scope
- **Surfaces (`--surface`)**: Antigravity (`antigravity`), Gemini CLI (`gemini-cli`), and OpenClaudio (`openclaudio`).
- **Entities**: Skills (`SKILL.md`), Custom Commands (`.toml`), Antigravity Rules (`.agents/rules/*.md`), Workflows, and Policy Engine configs across global (`~`) and workspace (`GITROOT` / `.`) magic folders.
- **Configuration**: Extensible via YAML (resolved in order: `~/.config/agc/config.yaml`, `~/.agc.yaml`, or `samples/config.yaml`) with zero hardcoded personal paths.
- **Core Capabilities**:
  - `agc <entity> list / search`: Inspect and filter customizations across surfaces.
  - `agc import`: Subsumes a skill, rule, or policy from a source path into a configured target repository/folder.

## Development Conventions
- **Language & Testing**: Written in Ruby (`bin/agc`, `lib/`). Every feature or fix must include unit tests and self-check/fix capabilities where applicable.
- **Documentation & Tracking**: Document new features in `USER_MANUAL.md` and track long-running tasks via GitHub Issues (`gh`).

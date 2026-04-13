# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.1] - 2026-04-13

### Fixed
- Enforce strict defaults for entity installations: `rules` and `workflows` now strictly target `agy` natively, while `policies` and `commands` strictly target `gc`, avoiding cross-pollution.

## [0.2.0] - 2026-04-12

### Added
- Added `install` feature to seamlessly symlink resources both locally and globally. Resolves [#1](https://github.com/palladius/agc/issues/1).
- `install` universally supports `skills`, `rules`, `workflows`, `policies`, and `custom_commands`.
- Added `USER_MANUAL.md` and updated `--help` with practical examples of local and global installations.

## [0.1.0] - 2026-04-12

### Added
- Unified `bin/agc` CLI replacing standalone `skills` and `agy-ricc` scripts.
- Implemented `skills`, `rules`, `workflows`, `policies`, and `custom_commands` integrations.
- Extracted global configuration constants natively into customizable `etc/riccardo_sample.yaml`.
- Minitest infrastructure built inside `test/test_agc.rb` to guarantee config parsing reliability.
- Robust flag handling across `--global`, `--local`, and `--for`.
- Native `catch-all` grouping format output for the `all` entity argument.

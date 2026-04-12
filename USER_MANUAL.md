# agc: User Manual

`agc` is the unified CLI for interacting with your skills, rules, and workflows across Antigravity (`agy`), and Gemini CLI (`gc`).

## Entities and Actions

You can use `agc` to manage the following entities:
* `skills` - Manage GC/Agy/Claude skills
* `rules` - Manage Agy Rules
* `workflows` - Manage Agy Workflows
* `custom_commands` - Manage GC CustomCommands
* `policies` - Manage GC Policy Engine

### Lists and Searches
To list entities: `$ agc skills list` or `$ agc skills`
To search: `$ agc skills search <term>` or `$ agc skills <term>`

## Installing Skills

By default, creating and hooking up skills manually can take time. `agc` helps automate symlink management with the `install` action. `agc` will automatically scan your `build_folders` configurations, intelligently deduplicate candidate folders from existing symlinks, and prioritize linking the original repository folder.

### Local Installation
Symlink a skill into the local directory (by default `.gemini/skills/` and `.agents/skills/`):

```bash
agc skills install journal-image-manager .
```

### Global Installation
Symlink a skill across your system (meaning all workspaces can access it, dropping it into `~/.gemini/skills/` and `~/.agents/skills/`):

```bash
agc skills install journal-image-manager --global
```

### Targeting Systems
If you only want the skill installed for one of your tool ecosystems, use the `--for` option:

```bash
agc skills install journal-image-manager . --for gc
agc skills install journal-image-manager . --for agy
```

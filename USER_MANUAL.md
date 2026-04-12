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

## Installing Entities (Skills, Rules, Workflows, Policies, etc)

By default, creating and hooking up skills, rules, and other entities manually can take time. `agc` helps automate symlink management with the `install` action. The command `agc <entity> install <name>` will automatically scan your `build_folders` configurations, intelligently deduplicate candidate folders (and files) from existing symlinks, and prioritize linking the original repository sources.

### Local Installation
Symlink a skill or rule into the local directory (by default `.gemini/<entity>` and `.agents/<entity>`):

```bash
agc skills install journal-image-manager .
agc rules install carlessian-justfile.md .
```

### Global Installation
Symlink a rule or skill across your system (meaning all workspaces can access it, dropping it into `~/.gemini/<entity>/` and `~/.agents/<entity>/`):

```bash
agc skills install journal-image-manager --global
agc workflows install generate_release_notes.md --global
```

### Targeting Systems
If you only want the entity installed for one of your tool ecosystems, use the `--for` option:

```bash
agc skills install journal-image-manager . --for gc
agc rules install carlessian-justfile.md . --for agy
```

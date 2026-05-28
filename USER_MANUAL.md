# agc: User Manual

`agc` is the unified CLI for interacting with your skills, rules, and workflows across Antigravity (`agy`), and Gemini CLI (`gc`).

## Entities and Actions

You can use `agc` to manage the following entities:
* `skills` - Manage GC/Agy/Claude skills
* `rules` - Manage Agy Rules
* `workflows` - Manage Agy Workflows
* `custom_commands` - Manage GC CustomCommands
* `policies` - Manage GC Policy Engine
* `plugins` - Manage Antigravity/Gemini CLI plugins
* `mcp` - Manage configured Model Context Protocol (MCP) servers

### Lists and Searches
To list entities: `$ agc skills list` or `$ agc skills`
To search: `$ agc skills search <term>` or `$ agc skills <term>`

For plugins:
- List: `$ agc plugins list` or `$ agc plugins`
- Search: `$ agc plugins search <term>`

Plugins are represented by the `🔌` emoji and show their version, a count of internal assets (skills, rules, workflows, commands, policies), and their description from `plugin.json`.

For MCP servers:
- List all: `$ agc mcp list` or `$ agc mcp`
- Filter by system: `$ agc mcp list --for agy` or `$ agc mcp list --for gc`
- Search servers: `$ agc mcp search <term>`

MCP servers are represented by the `⚙️` emoji and display their type (`[command]`, `[url]`, or `[httpUrl]`) and their execution configuration.

## Installing Entities (Skills, Rules, Workflows, Policies, Plugins, etc)

By default, creating and hooking up skills, rules, and other entities manually can take time. `agc` helps automate symlink management with the `install` action. The command `agc <entity> install <name>` will automatically scan your `build_folders` configurations, intelligently deduplicate candidate folders (and files) from existing symlinks, and prioritize linking the original repository sources.

### Local Installation
Symlink a skill, rule, or plugin into the local directory (by default `.gemini/<entity>` and `.agents/<entity>`):

```bash
agc skills install journal-image-manager .
agc rules install carlessian-justfile.md .
agc plugins install google-antigravity-sdk .
```

### Global Installation
Symlink a rule, skill, or plugin across your system (meaning all workspaces can access it, dropping it into `~/.gemini/<entity>/` and `~/.agents/<entity>/`, or `~/.gemini/config/plugins/` for global plugins):

```bash
agc skills install journal-image-manager --global
agc workflows install generate_release_notes.md --global
agc plugins install google-antigravity-sdk --global
```

### Targeting Systems
If you only want the entity installed for one of your tool ecosystems, use the `--for` option:

```bash
agc skills install journal-image-manager . --for gc
agc rules install carlessian-justfile.md . --for agy
agc plugins install google-antigravity-sdk --global --for agy
```

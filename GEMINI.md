---\nname: agc\ndescription: Antigravity Converged\n---

I've created `skills` and it amazing.
This morning I've created §agy` and its also amazing.
I realized what i want is something a bit MORE complex which manages:
- mutiple surfaces: Antigravity and Gemini CLI
- multiple entities:
* GC/Agy/Claude Skills (they're all the same)
* GC CustomCommands, why not.
* Agy Rules
* Agy Workfloes
* GC Policy Engine, why not.

All of this in a single script. we need to find something which has:

1. Equivalent to previous commands, eg `skills` might be now `agc skills list`
2. Brings here all the amazing knowledge of magic folders, both in tilde and in local GITROOT folder and maybe also dot (.).
3. Is extensible.

This is a Gemini firts tool, public.

## Extensibility

The original $GICBIN/skills is embrodied with Riccardo custom folders. This is NOT acceptable in the community.
Check the variations in $SAKURA/bin/skills where i rewrote it for a collegue.
I think the right place is to have some sort of YAML configuration file, defaulting to `~/.config/agc/config.yaml` or `~/.agc.yaml` or `~/git/agc/samples/config.yaml` . Whichever it finds first.

For long running TODOs use GH Issues FTW.

New functionalities should go into the USER MANUAL.md

## Import 

we need to have an import function, something that subsumes the skill/policy/whatevs from position X into some designated subsumption folder. We might have that folder in the YAML file, or maybe N folders (like public folder, privte folder, ,,) and have the tool propose those folders if >1 ? Just thinking out loud here.

## Surface

There should be a way to say "I'm using antigravity - show me all I should care about with this". And same with Gemini cLI. Maybe some `agc --surface antigravity` or `agc --surface gemini-cli` and then "all show" ?

## Referece

1. in `doc/resources' you have the original scripts. Once we understand them all, we can delete this reference :)
2. Final thing an echo on both scripts saying "This is obsolete, use instead ~/git/adc/bin/adc or something'
3. Script must be in Ruby.
4. Scrpt shall have tests. And ability to fix stuff.
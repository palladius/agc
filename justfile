


default:
	@just --list

list: default

test:
	ruby -I lib:test test/test_agc.rb

skills-equivalent:
	bin/agc skills list

agy-equivalent:
	bin/agc all list --for agy -a

antigravity-me:
	echo NO THIS JUST ADDS FOLDERS NOT READ ... antigravity . --add $GIC --add ~/git/skillume/
	antigravity .

github-issues:
	gh issue list

install:
	@if [ -f ~/.agc.yaml ]; then \
		echo "Nothing to do, we're good (~/.agc.yaml already exists)."; \
	else \
		cp etc/riccardo_sample.yaml ~/.agc.yaml; \
		echo "Copied riccardo_sample.yaml to ~/.agc.yaml"; \
		echo "Now it's time for you to edit the file and add your own skill folders."; \
	fi
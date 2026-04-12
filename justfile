


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

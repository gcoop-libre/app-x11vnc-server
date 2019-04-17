SHELL:=/bin/bash

role:
	mkdir -p tests/roles
	rm -f tests/roles/gcoop-libre.gnome-desktop
	cd tests/roles && ln -s ../../. gcoop-libre.gnome-desktop
	cd tests && ansible-playbook $(DEBUG) -i inventory test.yml -K -vvv

plugins/lookup/pass/lookup_plugins/pass.py:
	mkdir -p tests/plugins/lookup
	cd tests && git clone https://github.com/gcoop-libre/ansible-lookup-plugin-pass.git plugins/lookup/pass

dependencies: dependencies.yml plugins/lookup/pass/lookup_plugins/pass.py
	ansible-galaxy install -r dependencies.yml

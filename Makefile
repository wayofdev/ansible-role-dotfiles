###
### Variables
###

export ANSIBLE_FORCE_COLOR = 1
export PY_COLORS = 1
export PYTHONIOENCODING = UTF-8
export LC_CTYPE = en_US.UTF-8
export LANG = en_US.UTF-8

# https://serverfault.com/questions/1031491/display-ansible-playbook-output-properly-formatted
# https://stackoverflow.com/questions/50009505/ansible-stdout-formatting
export ANSIBLE_STDOUT_CALLBACK = unixy

TASK_TAGS ?= "dotfiles-install,dotfiles-configure"
REQS ?= requirements.yml
INSTALL_POETRY ?= true
POETRY_BIN ?= poetry
POETRY_RUNNER ?= poetry run
ANSIBLE_LATER_BIN = ansible-later

# leave empty to disable
# -v - verbose;
# -vv - more details
# -vvv - enable connection debugging
DEBUG_VERBOSITY ?= -v

### Lint yaml files
lint: later
	$(POETRY_RUNNER) yamllint .
	$(POETRY_RUNNER) ansible-lint . --force-color
.PHONY: lint

### Run tests
m-local:
	$(POETRY_RUNNER) molecule test -s default-macos-on-localhost -- $(DEBUG_VERBOSITY) --tags $(TASK_TAGS)
.PHONY: m-local

m-remote:
	$(POETRY_RUNNER) molecule test -s default-macos-over-ssh -- $(DEBUG_VERBOSITY) --tags $(TASK_TAGS)
.PHONY: m-remote

m-linux:
	$(POETRY_RUNNER) molecule test -s default -- $(DEBUG_VERBOSITY)
.PHONY: m-linux

login-mac:
	$(POETRY_RUNNER) molecule login \
		--host macos-12-vm \
		-s default-macos-over-ssh
.PHONY: login-mac

login-deb:
	$(POETRY_RUNNER) molecule create -s default
	$(POETRY_RUNNER) molecule login \
		--host debian-based-instance \
		-s default
.PHONY: login-deb

debug-version:
	$(POETRY_RUNNER) ansible --version
.PHONY: debug-version

later:
	$(POETRY_RUNNER) $(ANSIBLE_LATER_BIN) **/*.yml
.PHONY: later

### Install ansible dependencies
install: install-poetry install-deps
.PHONY: install

install-deps:
	$(POETRY_BIN) install
	$(POETRY_RUNNER) ansible-galaxy install -r $(REQS)
.PHONY: install-deps

install-poetry:
ifeq ($(INSTALL_POETRY),true)
	sudo sh contrib/poetry-bin/install.sh
else
	@echo "Poetry installation disabled by global variable! Exiting..."
	@exit 0
endif
.PHONY: install-poetry

### Git
hooks:
	$(POETRY_RUNNER) pre-commit install
	$(POETRY_RUNNER) pre-commit autoupdate
.PHONY: hooks

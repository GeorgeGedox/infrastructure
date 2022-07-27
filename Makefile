.DEFAULT_GOAL := help

.PHONY: requirements
requirements: venv ## Install Ansible requirements (roles and collections)
	$(VENV)/ansible-galaxy install -r requirements.yml --force

.PHONY: decrypt
decrypt: venv ## Decrypt all ansible vault files
	$(VENV)/ansible-vault decrypt group_vars/**/secrets.yml

.PHONY: encrypt
encrypt: venv ## Encrypt all ansible vault files
	$(VENV)/ansible-vault encrypt group_vars/**/secrets.yml

.PHONY: lint
lint: venv ## Run ansible-lint on the entire project
	$(VENV)/ansible-lint

.PHONY: setup
setup: requirements venv ## Setup project
	$(VENV)/pre-commit install -f

.PHONY: clean
clean: venv ## Remove all git hooks and remove venv
	$(VENV)/pre-commit uninstall
	$(MAKE) clean-venv

.PHONY: help
help: ## Display this help screen
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

include Makefile.venv
Makefile.venv:
	curl \
		-o Makefile.fetched \
		-L "https://github.com/sio/Makefile.venv/raw/v2022.07.20/Makefile.venv"
	echo "147b164f0cbbbe4a2740dcca6c9adb6e9d8d15b895be3998697aa6a821a277d8 *Makefile.fetched" \
		| sha256sum --check - \
		&& mv Makefile.fetched Makefile.venv

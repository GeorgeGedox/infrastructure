default:
	@echo "Please select an option"

requirements: venv
	$(VENV)/ansible-galaxy install -r requirements.yml --force

decrypt:
	$(VENV)/ansible-vault decrypt vars/vault.yml

encrypt:
	$(VENV)/ansible-vault encrypt vars/vault.yml

gitinit:
	@./git-init.sh
	@echo "\e[1;32mAnsible vault pre-commit hook installed!\e[0m"
	@echo "Create a .vaultfile file containing the vault password in the parent directory."

setup: requirements gitinit

include Makefile.venv
Makefile.venv:
	curl \
		-o Makefile.fetched \
		-L "https://github.com/sio/Makefile.venv/raw/v2022.07.20/Makefile.venv"
	echo "147b164f0cbbbe4a2740dcca6c9adb6e9d8d15b895be3998697aa6a821a277d8 *Makefile.fetched" \
		| sha256sum --check - \
		&& mv Makefile.fetched Makefile.venv

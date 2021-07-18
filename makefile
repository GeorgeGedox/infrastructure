default:
	@echo "Please select an option" 

requirements:
	ansible-galaxy install -r requirements.yml

decrypt:
	ansible-vault decrypt vars/vault.yml

encrypt:
	ansible-vault encrypt vars/vault.yml

gitinit:
	@./git-init.sh
	@echo "Ansible vault pre-commit hook installed!"
	@echo "Create a .vaultfile file with the vault password."
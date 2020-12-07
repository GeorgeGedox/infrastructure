default:
	@echo "Please select an option" 

requirements:
	ansible-galaxy install -r requirements.yml

decrypt:
	ansible-vault decrypt --vault-password-file .vaultfile vars/vault.yml

encrypt:
	ansible-vault encrypt --vault-password-file .vaultfile vars/vault.yml

all:
	ansible-playbook -i hosts.ini run.yml --vault-password-file .vaultfile

epsilon:
	ansible-playbook -i hosts.ini run.yml --vault-password-file .vaultfile --limit epsilon

custom:
	@read -p "Enter target hosts: " hosts; \
	read -p "Enter tags: " tags; \
	ansible-playbook -i hosts.ini run.yml --vault-password-file .vaultfile --limit $$hosts --tags $$tags

gitinit:
	@./git-init.sh
	@echo "Ansible vault pre-commit hook installed!"
	@echo "Create a .vaultfile file with the vault password."
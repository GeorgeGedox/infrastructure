# Ansible Infra Playbooks

This is a set of playbooks that I've used or I still use from time to time to prepare my home infrastructure. At first I used to to install and configure every single server or VM I had but now I've started using Kubernetes and GitOps to do most of that so this repository is used to keep random playbooks and roles that I use on fresh servers.

To check out my Kubernetes Cluster using GitOPS go here: https://github.com/GeorgeGedox/home-cluster

Feel free to have a look through the roles to use as an example or something but please **DO NOT RUN THE PLAYBOOKS AS IS**. There were made for my own servers and I usually modify them on the fly before running so don't take the risk of possibly destroying your existing configs.

# Usage
- Clone the repo
- Run `make setup` to install requirements
- Source the virtual environment `source .venv/bin/activate`
- Enjoy

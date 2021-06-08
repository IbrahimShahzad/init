## Pre-Requisites

- Ansible 
  -  [installation guide](https://docs.ansible.com/ansible/latest/installation_guide/index.html)

## Inventory

- create a new inventory file (should have the ip addresses of the host machine you want to set-up)

    ```sh
    echo "<INSERT_HOST_IP_ADDRESS_HERE>" > inventory
    ```

- Create your ssh key for the host machine

    ```sh
    ssh-keygen -t ed25519 -C  “ansible”
    ```

- copy the public key to the host machine

    ```sh
    ssh-copy-id -i ~/.ssh/ansible.pub <INSERT_HOST_IP_ADDRESS_HERE>
    ```


## Setup your dev environemnt

### setup VIM

- Run the following command to setup the vim environment

    ```sh
    ansible-playbook setup_dev.yml
    ansible-playbook --ask-become-pass setup_dev.yml #if you did not copy the ansible.pub ssh key file
    ```


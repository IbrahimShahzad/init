# init

Whenever i have to shift to a different VM, i need my environment set up before i start working again. It beomes tedious if i keep doing it manually. This repo is just a way for me to setup the stuff that i most commonly prefer setting up.

Contains 
- my rc/configuration file(s)
    - [Vim](vim/.vimrc)
    - [tmux](tmux/.tmux.conf)
- bash scripts for setting up the environment
    - [VIM](bash_scripts/setupvim.sh)
    - [PowerLine](bash_scripts/setupPowerline.sh)
    - [pktgen](bash_scripts/setup_pktgen.sh)
    - [DPDK 20.11.1](bash_scripts/setup_dpdk.sh)
    - [show hugepages info](bash_scripts/hugepagesinfo.sh)
- [ansible-playbooks for setting up my enivronment on multiple machines](ansible/README.md)
    - [VIM](ansible/setup_dev.yml) 
    - [PowerLine](ansible/setup_powerline.yml)
    - [pktgen](ansible/isntall_pktgen.yml)
    - [DPDK 20.11.1](ansible/isntall_dpdk.yml)
    - [Apache](ansible/isntall_apache.yml)
- Docs for
    - [writing good commit messages](writing_good_commits.md)
    - [color codes](docs/colors.md) for printf(s)
    - [list of vim plugins used](docs/listplugins.md)

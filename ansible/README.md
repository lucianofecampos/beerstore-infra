# Ansible

O Ansible é responsável pela instalação de softwares nas instâncias, como Telnet, Docker, etc.

O comando para executar o playbook do ansible é:

```
ansible-playbook --extra-vars "foo=bar" -i hosts playbook.yml --private-key id_rsa -v
```

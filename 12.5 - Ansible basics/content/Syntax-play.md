# Syntax used for Playbooks/Plays

Playbooks are formed by one or more "plays":

```sh
### Plays setion
- name: play 1
hosts: all
become: true
## Tasks to be executed
pre_tasks:
  name: do something before roles
  debug: msg="this is run before a role"
```
Please take in consideration the following:

 - Your playbook MUST be called using the yaml extension at the end of your file name, e.g. my_playbook.yml

 - Your playbook can have multiple plays, but I encorage you to be persisteng along you develop your playbook using multiple plays only when is absolutely necessary.

 - You must specify to which group (or in case you want to perform on all host) at the **begining** of your playbook with the reserverd keyword: **hosts**

 - **Your tasks name must have a descriptive name according to the job that will be executed.**

    
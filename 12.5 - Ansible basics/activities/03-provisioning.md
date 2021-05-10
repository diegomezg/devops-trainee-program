# Ansible basics
# Working with loops and systemd module 

### Instructions
- You must provisioning a new server. Requiered packages to install in
all nodes:
  - cups
  - vim
  - httpd
  - gcc

- Enable and start the service of httpd and cups, using the correct module for your distribution (service or systemd).

- Create playbook that install all of those packages using loops and
the system configuration also must be done using loops.

### Expected deliverables
- Playbook file with all of the necessary code.
- Inventory file
- Screenshot of the output of the command

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Loops.   | Trainee was able to install the packages using loops | %20 |
| Documentation | The markdown file includes the corresponding screenshots | 10% |
| Use of correct modules.   | Modules used are the correct for the system installed in the VM's | 70% |
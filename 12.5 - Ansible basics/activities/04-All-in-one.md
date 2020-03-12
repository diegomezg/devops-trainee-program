# Ansible basics
## Working with modules, Linux and modules!~~~

### Instructions
Create a new playbook and take in consideration the following:
  - You were assigned to create 1 printer (point to /dev/null)
  - Set the status of that printer to disabled.
  - Send Jobs to that disabled printer. (Tip: Use foor loop bash)
  - Extra points if that was created with playbooks :P

PLAYBOOK start here:

  - Under the main play, create a new folder called: DOU + local time of
your server (with date command) and take the backup of:
    - /var/spool* 
    - /var/cache/* 
    - /etc/cups/*

  - Each directory must be separated and must be compressed with gzip.

  - Get the output of lpstat –o and redirect to a new file called lpstat_o
  - Get the output of lpstat –t and redirect to a new file called lpstat_t
  - Send both files to the first folder.
  - Tar and compress the final folder which must have lpstat files and
spool directories, place in tmp or any other directory.

### Expected deliverables
- Ansible playbook with all of the steps requested.

### Evaluation

| Metric name | Description | % Value |
| ----------- |-------------| -------:|
| Avoid use of shell whenever is possible. | Trainee was able to find the module, and use it to apply the instruction requested. | %100 |

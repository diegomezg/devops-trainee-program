# Installation

Ansible is also easy to install. The following commands should be sufficient to complete your setup:

**Linux:**
```sh
#Redhat Derivated (CentOS, Fedora, Oracle Linux, Redhat)
#### As ROOT user OR sudo access:

yum install -y ansible

# Debian based

apt install ansible -y
```

You can validate your installation running the following command. If the output is similar, congratulations! Ansible is ready to run on your hosts.
```sh
[miguel@ans01pocmxdou ~]$ ansible --help
Usage: ansible <host-pattern> [options]

Define and run a single task 'playbook' against a set of hosts

Options:
  -a MODULE_ARGS, --args=MODULE_ARGS
                        module arguments
  --ask-vault-pass      ask for vault password
  -B SECONDS, --background=SECONDS
                        run asynchronously, failing after X seconds
                        (default=N/A)
  -C, --check           don't make any changes; instead, try to predict some
                        of the changes that may occur
  -D, --diff            when changing (small) files and templates, show the
                        differences in those files; works great with --check
  -e EXTRA_VARS, --extra-vars=EXTRA_VARS
                        set additional variables as key=value or YAML/JSON, if
                        filename prepend with @
  -f FORKS, --forks=FORKS
                        specify number of parallel processes to use
                        (default=5)

```

**MacOS**

You need to have pip in your machine. Pip is the default handler for python packages. Since Ansible is python-based, you should be able to install with:

```sh
pip install ansible
```
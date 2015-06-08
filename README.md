This is an open-source playbook for running an Nginx + Rails + Puma + PostgreSQL on Ubuntu 14.04 This has been extracted from my personal project which runs an appname-admin and a appname-public application on the same database. If you don't need a separate admin app, just remove references to it in the nginx, puma, app, and monit-related tasks in the web role.

# Playbooks

bootstrap - for setting up a new server. Based on http://lattejed.com/first-five-and-a-half-minutes-on-a-server-with-ansible

site - for setting up the site, to be run after bootstrap

# Roles

common - installs the base packages that will be used on all kinds of servers

web - for preparing Rails app server. In addition to installing the required packages and the Nginx config files, it also prepares the server for Rails deployment using Mina and the Engine Yard directory structure.

db - for setting up a Rails database. Creates the database, deploy database user with randomly-generated password, and database.yml in /data/appname/shared/config

Make sure deploy password in config/database.yml is consistent with the password in the db.yml playbook
(TODO: Use variables and other ansible tricks to put this in just one place)

# Getting Started

Copy `site.yml.template` to `site.yml` and fill in the necessary values for `app_name`, `db_password`, and `app_url`.

```
ssh-keygen -R your_hostname
cd ansible
source ./hacking/env-setup
ansible-playbook bootstrap.yml -vvvv --user root
ansible-playbook site.yml --extra-vars "run_bootstrap_tasks=true"
```


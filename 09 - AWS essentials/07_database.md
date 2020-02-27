Course content

Deploy RDS multi-AZ 

Instructions

-create MySQL DB

Navigate to RDS in AWS console
click create databse
choose standard, MySQL, freetier, v5.7

DB settings:

db instance: wordpress-test
master username: admin
master password: wordpre$$

db instance size: db.t2.micro

use default vpc
use default subnet group
public accessible: no

VPC security group: create new (rds-wordpress-test)
availability zone: us-east-1a
port: 3306

choose password auth

additional options

initial database name: wordpress


-Create EC2 web server

choose t2.micro
choose public IP
add tags: Name=wordpress-test-aacosta
create security group: allow ssh, HTTP and HTTPS


-Install wordpress


sudo dnf install wordpress

sudo systemctl enable httpd

sudo systemctl start httpd


-Configure wordpress

sudo setsebool -P httpd_can_network_connect_db=1
sudo setsebool -P httpd_can_sendmail=1

vi /etc/wp-config.php

set DB_NAME, DB_USER, DB_PASS and DB_HOST

generate salts: https://api.wordpress.org/secret-key/1.1/salt/


vi /etc/httpd/conf.d/wordpress.conf

change Require local to Require all granted

restart http server: systemctl restart httpd

create mysql repo: vim /etc/yum.repos.d/mysql-community.repo

[mysql80-community]
name=MySQL 8.0 Community Server
baseurl=http://repo.mysql.com/yum/mysql-8.0-community/fc/$releasever/$basearch/
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-mysql


dnf install mysql-community-client

mysql -h wordpress-test.cfjrjvh8boam.us-east-1.rds.amazonaws.com -u admin -p

optional:
CREATE USER 'wordpress-admin' IDENTIFIED BY ‘wordpress-pass';

GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress-admin';

FLUSH PRIVILEGES;

open url http://webserver/wordpress




-Enabling Multi-AZ and Backups
-Creating a read replica
-Promoting a read replica

Log in to the live AWS environment using the credentials provided.

Enable Multi-AZ Deployment


Back in the AWS console, navigate to RDS > Databases.
Click on our database instance.
Click Modify.
Under Multi-AZ deployment, click Yes.
Change Backup Retention to 1 day, needed later for read replicas.
Click Continue.
Under Scheduling of modifications, select Apply immediately, and then click Modify DB Instance.
Once the instance shows Multi-AZ is enabled (it could take about 10 minutes), select the database instance.
Click Actions, and select Reboot.
On the reboot page, select Reboot With Failover?, and click Reboot.
Use the web page to monitor the outage (normally about 30 seconds).
The Multi-AZ standby is now the primary.

Create a Read Replica

With the database instance still selected, click Actions, and select Create read replica.
For Destination region, select US East (N. Virginia).
Enter a name under DB instance identifier (e.g., "wordpress-rr").
Leave the other defaults, and click Create read replica. It will take a few minutes for it to become available.

Create backup

Select db instance
Go to actions, take snapshot
Enter a name for the snapshot

Restore backup

Go to AWS RDS, snapshots
select snapshot from the list
Go to Actions and select Restore snapshot


Promote the Read Replica and Change the CNAME Records Set in Route 53 to the New Endpoint

Once the read replica is available, check the circle next to it.
Click Actions, and select Promote.
Leave the defaults, and click Continue, and then click Promote Read Replica.
Use the web page to monitor for downtime.
Once the read replica is available, click to open it.
In the Connectivity & security section, copy the endpoint under Endpoint & port.
Open Route 53 in a new tab.
Click Hosted zones, and select the sysopsdatabase hosted zone.
Click Go to Record Sets.
Click the CNAME row.
Replace what's currently in the Value box with the endpoint you copied.
Click Save Record Set.
Monitor using the web page for downtime.




Expected deliverables: wordpress application running with RDS backend, screenshots of config/install process and scripts



Create RDS multi-AZ using MySQL engine
30%

Create DB for application
10%

Create and grant user "appuser" perms on DB
10%

Run application on container linked to RDS
40%

Bonus points: Automate everything



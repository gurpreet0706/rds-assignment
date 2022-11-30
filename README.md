# Two Standalone  Master and Replica RDS for MySQL

Configuration in this directory creates set of 2 RDS Mysql resources master1 & master2 and replica of master1 in the same VPC.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

Note that this may create resources which cost money. Run `terraform destroy` when you don't need these resources.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.28 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_master"></a> [master](#module\_master) | terraform-aws-modules/rds/aws | n/a |
| <a name="module_replica"></a> [replica](#module\_replica) | terraform-aws-modules/rds/aws | n/a |
| <a name="module_security_group"></a> [security\_group](#module\_security\_group) | terraform-aws-modules/security-group/aws | ~> 4.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 3.0 |

## Resources

o resources.

## Initiating replication between 2 Master RDS instances

1. Create a EC2 instance by using ubuntu image in one of the  public subnet of the VPC created
2. Install Mysql on EC2 instance
   sudo apt update
   sudo apt-get install mysql-server

3. Setup EC2 connection with Both master1 and master2 RDS instances from console in RDS Service console

4. Login into ec2 instance and then conect with rds master instances
5. Login in Master1 RDS-mysql instance with command
     mysql -h <endpoint of the master1 rds instance> -P 3306 -u admin -p
 run below mentioned commands

CREATE USER 'repl_user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT REPLICATION CLIENT, REPLICATION SLAVE ON *.* TO 'repl_user'@'%';

Get the bin change log file name and position by running below command and make a note of this
SHOW MASTER STATUS

then exit from the Master1 rds instance

6. login into master2 rds instance
mysql -h <endpoint of the master2 rds instance> -P 3306 -u admin -p

run below commands

CALL mysql.rds_set_external_master (
  host_name
  , host_port
  , replication_user_name
  , replication_user_password
  , mysql_binary_log_file_name
  , mysql_binary_log_file_location
  , ssl_encryption
);


for example:
call mysql.rds_set_external_master(
  'master.ccoyjti7kwxw.us-east-1.rds.amazonaws.com',# endpoint of Master1 rds instance
  3306, # port
  'repl_user', # replication user we created above in master1 rds instance
  'password', #password for replication user  we created above in master1 rds instance
  'mysql-bin-changelog.000008', # bin file location which we got from task 5
  157, position from task 5
  0); #  value that specifies whether Secure Socket Layer (SSL) encryption is used on the replication connection. 1 specifies to use SSL encryption, 0 specifies to not use encryption. The default is 0.


then run below command
Call mysql.rds_start_replication;

and now check the status of the slave now.
run show slave status, you can see replication has been started.



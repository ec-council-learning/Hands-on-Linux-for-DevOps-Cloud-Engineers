# Hands on Linux for DevOps and Cloud Engineers

This is the Terraform files for this course.

These files will create the following in AWS:

* VPC
* Subnet
* Security Group
* Internet Gateway
* Route Table
* EC2 instance


## Files

ec2.tf
> Contains recipe for a Linux instance

igw.tf
> Contains recipe for an Internet Gateway

route.tf
> Contains recipe for a demo Route Table

security_group.tf
> Contains recipe for a demo Security Group

subnet.tf
> Contains recipe for the demo Subnet

vars.tf
> Contains variables used in all the files

vpc.tf
> Contains recipe for the demo VPC

create_ssh_keys.sh
> Creates a key pair for use with the Linux instance

## Getting Started

To get started you must first make sure you have downloaded `Terraform` for your specific [OS](https://).

After it is installed, you must first initialize terraform by typing the following in your terminal:

```
terraform init
```

This will install the AWS provider for Terraform. 

Next, you want to do a `dry-run` and use the plan command for terraform. In that same terminal, type the following:

```
terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create
....

Plan: 8 to add, 0 to change, 0 to destroy.
```

Your output should look similar. The main goal is there should not be any errors. If there are any errors, please address them before moving forward.



## Key Pair
To create your keypair, run `create_ssh_keys.sh` in the terminal. Do not forget to use a passphrase to secure it.

Your output should look similar.

```
./create_ssh_keys.sh
Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in ./lab-key-pair
Your public key has been saved in ./lab-key-pair.pub
The key fingerprint is:
SHA256:DB++SvmjEVeS49jSauXrbi2AvRPAWXHwhHtO38uGJp8 codered-demo
The key's randomart image is:
+---[RSA 3072]----+
|      o+o        |
|      o+ .       |
|   . o..* .      |
|    + .Xo=       |
|     +++S. .     |
|    . +O... .    |
|      *+o. o .   |
|     oo+=.+.+    |
|      o*=*E.     |
+----[SHA256]-----+
```



# aws-vpcflow-log
Pull the log from vpc S3 bucket to local infrastrutre 


------------How to pull the log from S3 bucket to central log server------

1:- First we need to create vpc flow log in vpc
2:- We need to craet s3 bucket for vpc flow log creation
3:- We need to install s3cmd/aws cli in central log server like logstash etc
4:- Need to write script for pull log from S3 bucket to central logstash server (logstash)

------------How to Install s3cmd in Linux and Manage Amazon s3 Buckets---------

s3cmd is a command line utility used for creating s3 buckets, uploading, retrieving and managing data to Amazon s3 storage. This article will help you to how to use install s3cmd on CentOS, RHEL, OpenSUSE, Ubuntu, Debian & LinuxMint systems and manage s3 buckets via command line in easy steps.

Install s3cmd on Linux:-

s3cmd is available in default rpm repositories for CentOS, RHEL and Ubuntu systems, You can install it using simply executing following commands on your system.

On CentOS/RHEL:

yum install s3cmd

On Ubuntu/Debian:

sudo apt-get install s3cmd

On SUSE Linux Enterprise Server 11:

zypper addrepo http://s3tools.org/repo/SLE_11/s3tools.repo
zypper install s3cmd


Install Latest s3cmd using Source
If you are not getting the latest version of s3cmd using package managers, You can install last s3cmd version on your system using the source code. Visit this url or use below command to download latest version of s3cmd.

Install Latest s3cmd using Source
If you are not getting the latest version of s3cmd using package managers, You can install last s3cmd version on your system using the source code. Visit this url or use below command to download latest version of s3cmd.

wget https://sourceforge.net/projects/s3tools/files/s3cmd/2.0.1/s3cmd-2.0.1.tar.gz
tar xzf s3cmd-2.0.1.tar.gz
Now install it using below command with source files.

cd s3cmd-2.0.1
sudo python setup.py install

Configure s3cmd Environment
In order to configure s3cmd we would require Access Key and Secret Key of your S3 Amazon account. Get these security keys from aws securityCredentials page. If will prompt to login to your amazon account.

After getting key files, use below command to configure s3cmd.

# s3cmd --configure

Enter new values or accept defaults in brackets with Enter.
Refer to user manual for detailed description of all options.

Access key and Secret key are your identifiers for Amazon S3
Access Key: xxxxxxxxxxxxxxxxxxxxxx
Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

Encryption password is used to protect your files from reading
by unauthorized persons while in transfer to S3
Encryption password: xxxxxxxxxx
Path to GPG program [/usr/bin/gpg]:

When using secure HTTPS protocol all communication with Amazon S3
servers is protected from 3rd party eavesdropping. This method is
slower than plain HTTP and can't be used if you're behind a proxy
Use HTTPS protocol [No]: Yes

New settings:
  Access Key: xxxxxxxxxxxxxxxxxxxxxx
  Secret Key: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
  Encryption password: xxxxxxxxxx
  Path to GPG program: /usr/bin/gpg
  Use HTTPS protocol: True
  HTTP Proxy server name:
  HTTP Proxy server port: 0

Test access with supplied credentials? [Y/n] Y
Please wait, attempting to list all buckets...
Success. Your access key and secret key worked fine :-)

Now verifying that encryption works...
Success. Encryption and decryption worked fine :-)

Save settings? [y/N] y
Configuration saved to '/root/.s3cfg'

Uses of s3cmd Command Line
Once the configuration is successfully completed. Now find below command details to how to manage s3 buckets using commands.

1. List All S3 Bucket
Use the following command to list all s3 buckets in your aws account.

# s3cmd ls
2. Creating New Bucket
To create a new bucket in Amazon s3 use below command. It will create bucket named tecadmin in S3 account.
# s3cmd mb s3://ajeet-log
Bucket 's3://ajeet-log/' created

3. Uploading file in Bucket
Below command will upload file file.txt to s3 bucket using s3cmd command.
# s3cmd put file.txt s3://ajeet-log/

file.txt -> s3://ajeet-log/file.txt  [1 of 1]
 190216 of 190216   100% in    0s  1668.35 kB/s  done



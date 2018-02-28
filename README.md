# Oracle Cloud Terraform

This is a docker project which will provision a kubernetes cluster in oracle cloud


Notes:
- Does a terraform refresh each run.  Does not store a local or use a remote state file.  Do not run multiple runs at the same time

# How to build
* ensure that you have docker/docker-compose installed.  Docker for windows has some quirks regarding mounting local files to your container that you may have to deal with
* run docker build -t [tag]  for example docker build -t tf (this is what docker-compose file expects)
* Note that the versions of the kubernetes client and the [oracle OCI provider](https://github.com/oracle/terraform-provider-oci) are hardcoded in the Dockerfile.  You will probably want to keep these up-to-date

Build Option 2
* run docker-compose build

# How to configure
## kubercreds.tfvars
this file is local (it gets mounted to the running container, so it doesn't require a docker build after a change) and contains oracle cloud credentials and info.  It is in the format "key = value" and should have the following keys/values
* compartment_ocid = 
* user_ocid =
* tenancy_ocid =
* fingerprint =
* private_key_path =
* region =

Notes:

-- The private_key_path should point to a pem format oracle api private key 



## kubersettings.tfvars
This file is local (it gets mounted to the running container, so it doesn't require a docker build after a change)

It has the provider settings (see https://github.com/oracle/terraform-kubernetes-installer)

For example, settings for the number of masters/workers etc

The docker container when build gets the latest "master branch" version of the terraform-kubernetes-installer and options are being added regularly so please read the doc

## .env
This file is used (along w. the docker-compose.yaml) to set env vars inside the container

View the contents of the file/comments for details

Currently you can set an option to have the container not die after execution.  This is useful for troubleshooting or for running other commands (e.g. terraform destroy)
# How to run
* docker-compose up

The run should create a kadmin folder on your local box which will contain a kubeconfig file to be used to access this cluster


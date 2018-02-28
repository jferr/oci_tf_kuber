#!/bin/ash
pwd
ts=$(date "+%Y-%m-%d_%H-%M-%S")
cp /root/config/kubersettings.tfvars /root/logs/${ts}_vars.txt
cp /root/config/*.tfvars /root/terraform-kubernetes-installer
cd /root/terraform-kubernetes-installer
/bin/terraform init 
#/bin/terraform refresh -var-file=kubersettings.tfvars -var-file=kubercreds.tfvars
#/bin/terraform apply -auto-approve -var-file=kubersettings.tfvars -var-file=kubercreds.tfvars -state-out=/root/logs/${ts}_state.txt | tee /root/logs/${ts}_applylog.txt

/bin/terraform apply -auto-approve -refresh=true -var-file=kubersettings.tfvars -var-file=kubercreds.tfvars | tee /root/logs/${ts}_applylog.txt


[ -f /root/terraform-kubernetes-installer/generated/kubeconfig ] && cp /root/terraform-kubernetes-installer/generated/kubeconfig /root/kadmin

#rundebug="${rundebug:-no}"
#if [ ${rundebug} == "true" ]; then
  echo "Copying state file to local ./output_logs"
  [ -f /root/terraform-kubernetes-installer/terraform.tfstate ] && cp /root/terraform-kubernetes-installer/terraform.tfstate /root/logs/${ts}.tfstate
  [ -f /root/terraform-kubernetes-installer/terraform.tfstate.backup ] && cp /root/terraform-kubernetes-installer/terraform.tfstate.backup /root/logs/${ts}.tfstate.backup

#fi  

runforever="${keeprunning:-no}"
# To keep it running
#set env var keeprunning to anything
if [ $runforever == "true" ]; then
  echo "Will keep running rather than die because of setting in ./.env file"
  tail -f /dev/null
fi  

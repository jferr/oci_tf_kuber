from hashicorp/terraform
RUN mkdir -p /root/.terraform.d/plugins; mkdir -p /root/logs
ADD https://github.com/oracle/terraform-provider-oci/releases/download/2.0.7/linux.tar.gz  /root/.terraform.d/plugins/
RUN cd /root/.terraform.d/plugins && tar -xzf /root/.terraform.d/plugins/linux.tar.gz 
RUN cd /root && git clone https://github.com/oracle/terraform-kubernetes-installer.git 
#COPY terraform.tfvars /root/terraform-kubernetes-installer
COPY .terraformrc /root/.terraform.d/plugins/
COPY doit.sh /root/doit.sh 
ADD  https://storage.googleapis.com/kubernetes-release/release/v1.9.3/bin/linux/amd64/kubectl /bin
RUN chmod 777 /bin/kubectl
RUN chmod 777 /root/doit.sh
RUN cd /root
ENTRYPOINT ["/root/doit.sh" ]

#arch
# aarch64 or arm64

FROM docker.io/redhat/ubi9-minimal:latest

WORKDIR /root
RUN microdnf install -y tar gzip openssl unzip

#aws
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

#eks
RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.120.0/eksctl_Linux_arm64.tar.gz" | tar xz -C /tmp && mv /tmp/eksctl /usr/local/bin

#kubectl by amazon
RUN curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/arm64/kubectl && chmod +x ./kubectl && mv kubectl /usr/local/bin

#helm v3
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#terraform 
RUN curl -LO https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_arm64.zip && unzip terraform_1.3.5_linux_arm64.zip && mv terraform /usr/local/bin



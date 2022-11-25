#!/bin/bash

ARCH=$(uname -m)

case "$ARCH"
in
    "x86_64" | "amd64")
        #aws
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
        #eks
        curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.120.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp && mv /tmp/eksctl /usr/local/bin
        #kubectl by amazon
        curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl && chmod +x ./kubectl && mv kubectl /usr/local/bin
        #helm v3
        curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
        #terraform
        curl -LO https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_amd64.zip && unzip terraform_1.3.5_linux_amd64.zip && mv terraform /usr/local/bin
        ;;
    "arm64" | "aarch64")
        #aws
        curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
        #eks
        curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.120.0/eksctl_Linux_arm64.tar.gz" | tar xz -C /tmp && mv /tmp/eksctl /usr/local/bin
        #kubectl by amazon
        curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/arm64/kubectl && chmod +x ./kubectl && mv kubectl /usr/local/bin
        #helm v3
        curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
        #terraform
        curl -LO https://releases.hashicorp.com/terraform/1.3.5/terraform_1.3.5_linux_arm64.zip && unzip terraform_1.3.5_linux_arm64.zip && mv terraform /usr/local/bin
        ;;
    "*")
        # unsupported platform
        ;;
esac

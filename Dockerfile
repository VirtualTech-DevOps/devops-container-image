#arch
# amd64 or x86_64

FROM docker.io/redhat/ubi9-minimal:latest

WORKDIR /root

RUN microdnf install -y tar gzip openssl unzip
COPY install.sh /tmp/
RUN bash /tmp/install.sh
RUN rm -rf /tmp/install.sh /root/aws* /root/terraform_*.zip /root/awscliv2.zip

CMD ["/bin/bash"]

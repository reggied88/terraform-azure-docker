FROM ubuntu:16.04

ENV TERRAFORM_VERSION=0.11.7
ENV MICROSOFT_SIGNING_KEY=52E16F86FEE04B979B07E28DB02C46DF417A0893

CMD bash

WORKDIR /

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y curl \
  && apt-get install -y unzip \
  && apt-get install -y python \
  && apt-get install -y apt-transport-https \
  && apt-get install -y lsb-release \
  && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/azure-cli.list \
  && apt-key adv --keyserver packages.microsoft.com --recv-keys ${MICROSOFT_SIGNING_KEY} \
  && apt-get update \
  && apt-get install -y azure-cli \
  && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
  && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/bin \
  && rm -rf /var/lib/apt/lists/* \
  && echo "PS1='Terraform Azure Sandbox >> '" >> /root/.bashrc
# terraform-azure-docker
This repository is used to build an image that contains the azure-cli (python) & terraform applications so that you can easily get up and running with terraform development in azure using docker.

## Setup

### Setup Requirements

* Docker ( 18.03.0 >= )

## Building the Image
Once the above setup requirements are met it's simply a matter of following the basic docker image build workflow.

```bash
    > docker build --tag tragiccode/terraform-azure-docker .
```

## Testing the Image
To ensure everything got installed correctly you can quickly execute the following commands to spin up one-off containers.

```bash
    > docker run -i -t tragiccode/terraform-azure-docker terraform
    > docker run -i -t tragiccode/terraform-azure-docker az
```

## Usage
My worflow for using this image & a container is the following.

1. Develop locally on my host machine using vscode or any editor of your choice.
1. In order to test the terraform changes spin up the container using the following.

```bash
    > docker run -it -v ~/source/github/tragiccode/terraform-code/:/terraform-code tragiccode/terraform-azure-docker
    > cd /terraform-code
    > <start executing terraform commands here>
```

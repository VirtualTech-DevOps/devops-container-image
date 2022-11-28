#!/bin/bash

devops_login() {
    docker run --rm -it \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           -v $(dirname ${KUBECONFIG:-${HOME}/.kube/config}):/root/.kube \
           --env AWS_PROFILE \
           --env AWS_ACCESS_KEY_ID \
           --env AWS_SECRET_ACCESS_KEY \
           --env AWS_DEFAULT_REGION \
           devops-container-image \
           /bin/bash
}

kubectl() {
    docker run --rm \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           -v $(dirname ${KUBECONFIG:-${HOME}/.kube/config}):/root/.kube \
           --env AWS_PROFILE \
           --env AWS_ACCESS_KEY_ID \
           --env AWS_SECRET_ACCESS_KEY \
           --env AWS_DEFAULT_REGION \
           devops-container-image \
           kubectl $@
}

aws() {
    docker run --rm \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           --env AWS_PROFILE \
           --env AWS_ACCESS_KEY_ID \
           --env AWS_SECRET_ACCESS_KEY \
           --env AWS_DEFAULT_REGION \
           devops-container-image \
           aws $@
}

helm() {
    docker run --rm \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           -v $(dirname ${KUBECONFIG:-${HOME}/.kube/config}):/root/.kube \
           --env AWS_PROFILE \
           --env AWS_ACCESS_KEY_ID \
           --env AWS_SECRET_ACCESS_KEY \
           --env AWS_DEFAULT_REGION \
           devops-container-image \
           helm $@
}

terraform() {
    docker run --rm \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           --env AWS_PROFILE \
           --env AWS_ACCESS_KEY_ID \
           --env AWS_SECRET_ACCESS_KEY \
           --env AWS_DEFAULT_REGION \
           devops-container-image \
           terraform $@
}

eksctl() {
    docker run --rm \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           --env AWS_PROFILE \
           --env AWS_ACCESS_KEY_ID \
           --env AWS_SECRET_ACCESS_KEY \
           --env AWS_DEFAULT_REGION \
           devops-container-image \
           eksctl $@
}

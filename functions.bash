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
    if [ -z "$HELM_CONFIG_HOME" ] && [ -x "$(which helm)" ]; then
        eval "$(command helm env | grep '^HELM_CONFIG_HOME=')"
    fi

    # HELM_CONFIG_HOMEをセットしていなくて、helmコマンドがインストールされていない場合は~/.config/helmを強制
    local helm_config_home="${HELM_CONFIG_HOME:-${HOME}/.config/helm}"
    install -Dd "$helm_config_home"

    docker run --rm \
           -w /workdir \
           -v $(pwd):/workdir \
           -v ${HOME}/.aws:/root/.aws \
           -v $(dirname ${KUBECONFIG:-${HOME}/.kube/config}):/root/.kube \
           -v "$helm_config_home:/root/.config/helm" \
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

#!/usr/bin/env bash

set -e

## Waaaaaaay smash it
# Install helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get | bash

# Install kubectl
KUBECTL_RELEASE=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
curl -LO https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_RELEASE/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# Install aws-iam-authenticator
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.11.5/2018-12-06/bin/linux/amd64/aws-iam-authenticator
chmod +x ./aws-iam-authenticator
sudo mv ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

# Install aswcli
pip3 install awscli --upgrade

# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/latest_release/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin

# Install jq
sudo apt-get update && sudo apt-get install jq

# Environment variable of public key to file.
sudo echo $SSH_PUBLIC_KEY > "$HOME/.ssh/id-rsa-gateway.pub"

# Done!
echo "### We done, boi! ###"
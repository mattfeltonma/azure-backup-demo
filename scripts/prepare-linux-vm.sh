#!/bin/bash

# Add repositories
curl -sL https://packages.microsoft.com/keys/microsoft.asc |
    gpg --dearmor |
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" |
    sudo tee /etc/apt/sources.list.d/azure-cli.list

# Install Azure CLI
sudo apt-get update
sudo apt-get -y install ca-certificates curl apt-transport-https lsb-release gnupg
sudo apt-get -y install azure-cli

# Create test files and folders
sudo mkdir /var/sample-files
cat <<EOF > samplefile1.txt
This is sample file 1
EOF

cat <<EOF > samplefile2.txt
This is sample file 2
EOF

cat <<EOF > samplefile3.txt
This is sample file 3
EOF

sudo chmod -R 644 /var/sample-files
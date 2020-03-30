#/bin/bash

# .NET Install 
# 
# https://dotnet.microsoft.com/download/dotnet-core/sdk-for-vs-code?utm_source=vs-code&amp;utm_medium=referral&amp;utm_campaign=sdk-install
# https://docs.microsoft.com/en-gb/dotnet/core/install/linux-package-manager-debian10

# udo apt-get update

function install() {
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg
    sudo mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/
    wget -q https://packages.microsoft.com/config/debian/10/prod.list
    sudo mv prod.list /etc/apt/sources.list.d/microsoft-prod.list
    sudo chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg
    sudo chown root:root /etc/apt/sources.list.d/microsoft-prod.list

    sudo apt-get update
    sudo apt-get install -y apt-transport-https

    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-3.1
    sudo apt-get install -y aspnetcore-runtime-3.1
    sudo apt-get install dotnet-runtime-3.1

} && install
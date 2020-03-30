#/bin/bash

# .NET Install 
# 
# https://dotnet.microsoft.com/download/dotnet-core/sdk-for-vs-code?utm_source=vs-code&amp;utm_medium=referral&amp;utm_campaign=sdk-install
# https://docs.microsoft.com/en-gb/dotnet/core/install/linux-package-manager-ubuntu-1910

# udo apt-get update

function install() {
    wget -q https://packages.microsoft.com/config/ubuntu/19.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb

    sudo apt-get update
    sudo apt-get install -y apt-transport-https

    sudo apt-get update
    sudo apt-get install -y dotnet-sdk-3.1
    sudo apt-get install -y aspnetcore-runtime-3.1
    sudo apt-get install dotnet-runtime-3.1

    # Disable Telemetry
    # export DOTNET_CLI_TELEMETRY_OPTOUT=true

} && install
#!/bin/bash

# NordVPN
#
# https://nordvpn.com

# Install 
# 
# https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-and-Linux-Mint.htm

# Featues
#
# CyberSec      - https://support.nordvpn.com/General-info/Features/1047407402/What-is-CyberSec.htm
# KillSwitch    - https://support.nordvpn.com/General-info/Features/1047407832/What-is-a-Kill-Switch-and-how-does-it-work.htm
# TCP/UDP       - https://support.nordvpn.com/General-info/1047408102/What-are-the-pros-cons-with-TCP-vs-UDP.htm
# Server Types  - https://support.nordvpn.com/General-info/Features/1047407962/What-do-the-different-server-categories-mean.htm
#  Onion        - https://support.nordvpn.com/General-info/Features/1047408202/What-is-Onion-and-how-to-use-it.htm
#  Dedicated IP - https://support.nordvpn.com/General-info/Features/1061840622/Dedicated-IP-addresses.htm
#  Obfuscated   - https://www.youtube.com/watch?v=aJSCC54wVcg

# Commands 
# 
# nordvpn login - Log in.
# nordvpn connect or nordvpn c - Connect to VPN. To connect to specific servers, use nordvpn connect <country_code server_number> (eg. nordvpn connect uk715)
# nordvpn disconnect or nordvpn d - Disconnect from VPN.

# nordvpn set or nordvpn s - Set a configuration option. Possible options:
# nordvpn set cybersec on or off - Enable or disable CyberSec
# nordvpn set killswitch on or off - Enable or disable Kill Switch
# nordvpn set autoconnect on or off - Enable or disable Autoconnect. You can set a specific server for automatic connection using nordvpn set autoconnect on country_code+server_number. Example: nordvpn set autoconnect on us2435.

# nordvpn set dns 1.1.1.1 1.0.0.1 - Set custom DNS (you can set up a single DNS or two like shown in this command).
# nordvpn set protocol udp or tcp - Switch between UDP and TCP protocols
# nordvpn set obfuscate on or off - Enable or disable Obfuscated Servers.

# nordvpn whitelist add port 22 - Open incoming port 22 (the port number can be different). You can also whitelist multiple ports - just separate them with a space.
# nordvpn whitelist remove port 22 - Remove the rule added with the above command
# nordvpn whitelist add subnet 192.168.0.0/16 - Add a rule to whitelist your specified subnet.
# nordvpn whitelist remove subnet 192.168.0.0/16  - Remove a rule to whitelist your specified subnet.

# nordvpn settings - See the current settings.
# nordvpn status - See the connection status.
# nordvpn countries - See the country list.
# nordvpn cities - See the city list.
# nordvpn groups - See a list of available server groups.
# nordvpn logout - Log out.
# nordvpn help or nordvpn h - See the list of commands or help for one command.


function install() {
    sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
    # sudo wget https://repo.nordvpn.com/gpg/nordvpn_public.asc -O - | sudo apt-key add -
    sudo dpkg -i ./nordvpn-release_1.0.0_all.deb
    sudo apt update
    sudo apt install nordvpn
    rm -f nordvpn-release_1.0.0_all.deb
} && install

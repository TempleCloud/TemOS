# Debian 10

## Introduction

1. Some notes on configuring `Debian 10`.

---

## Install

1. Download ISO.

2. Create bootable USB.

3. Configure BIOS, boot, install.

---

## Customise

1. Install `Firefox`. Sign in to account to get plugins and bookmarks.

2. Install `curl`, `wget`, `git`.

    1. Configure `git`

        ```bash
        git config --global user.email "tim.langford@gmail.com"
        git config --global user.name "Tim Langford"
        ```

3. Create new `ssh key pair` and register public key with `github` account.

4. Download `temos` project to `$HOME/Work`.

5. Ensure `temos/dotfiles/bash/dot_bash_profile` sets `$TEMOS_HOME` correctly.

6. Run `temos/script/debian10-install.sh` to install base system.

7. Configure GNOME. Dark Themes, Extensions, DashToDock, Windows Buttons, scrolling, etc.

8. Install NordVPN and configure.

    ```bash
    sudo wget https://repo.nordvpn.com/gpg/nordvpn_public.asc -O - | sudo apt-key add -
    sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
    sudo dpkg -i `pwd`/nordvpn-release_1.0.0_all.deb
    sudo apt update
    sudo apt install nordvpn
    ```

    ```bash
    nordvpn login
    nordvpn connect
    nordvpn status
    nordvpn set autoconnect on
    nordvpn set killswitch on
    nordvpn settings
    ```

    * firefox https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-and-Linux-Mint.htm


9. Install git projects

    ```bash
    temos/dotfiles/git/update-repos.sh
    ```

10. Delete any excess GNOME crud.

    ```bash
sudo apt purge -y --auto-remove libreoffice-*
sudo apt purge -y --auto-remove totem
sudo apt purge -y --auto-remove shotwell
sudo apt purge -y --auto-remove rhythmbox
sudo apt purge -y --auto-remove simple-scan
sudo apt purge -y --auto-remove fcitx-*
sudo apt purge -y --auto-remove uim-*
sudo apt purge -y --auto-remove mozc-*
sudo apt purge -y --auto-remove mlterm-*
sudo apt purge -y --auto-remove xiterm+thai
sudo apt purge -y --auto-remove im-config
sudo apt purge -y --auto-remove anthy kasumi
sudo apt purge -y --auto-remove goldendict
sudo apt purge -y --auto-remove hdate-applet
sudo apt purge -y --auto-remove gnome-calculator
sudo apt purge -y --auto-remove gnome-calendar
sudo apt purge -y --auto-remove gnome-clocks
sudo apt purge -y --auto-remove gnome-contacts
sudo apt purge -y --auto-remove gnome-documents
sudo apt purge -y --auto-remove gnome-maps
sudo apt purge -y --auto-remove gnome-music
sudo apt purge -y --auto-remove gnome-weather
sudo apt purge -y --auto-remove gnome-sound-recorder
sudo apt purge -y --auto-remove gnome-todo
sudo apt purge -y --auto-remove gnome-klotski
sudo apt purge -y --auto-remove gnome-mines
sudo apt purge -y --auto-remove gnome-robots
sudo apt purge -y --auto-remove gnome-mahjongg
sudo apt purge -y --auto-remove gnome-nibbles
sudo apt purge -y --auto-remove gnome-sudoku
sudo apt purge -y --auto-remove gnome-tetravex
sudo apt purge -y --auto-remove swell-foop
sudo apt purge -y --auto-remove quadrapassel
sudo apt purge -y --auto-remove gnome-taquin
sudo apt purge -y --auto-remove tali
sudo apt purge -y --auto-remove lightsoff
sudo apt purge -y --auto-remove aisleriot
sudo apt purge -y --auto-remove five-or-more
sudo apt purge -y --auto-remove four-in-a-row
sudo apt purge -y --auto-remove hitori
sudo apt purge -y --auto-remove iagno
    ```

    ```bash
    sudo apt-get clean
    sudo apt-get autoremove
    ```

11. Get the default gnome-shell back

    ```bash
    sudo apt install --reinstall gnome-shell-common
    ```

12. Install other utility wotnots.

    ```bash
    sudo apt install tree
    sudo apt install netcat
    ```

13. Install Dropbox

    ```bash
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
    if [ -f "~/.dropbox-dist/dropboxd &"  ]; then
        alias dropbox="~/.dropbox-dist/dropboxd &"
    fi
    ```

14. Install Virtualbox

    * [Debian 10 Virtual Box](https://computingforgeeks.com/install-virtualbox-ubuntu-debian/)

    * See: `temos/install/virtualbox/debian-apt-install.sh` 

15. Install QEMU / KVM

    * [Debian 10 KVM / QEMU / LibVirt](https://linuxhint.com/install_kvm_debian_10/)

    ```bash
    grep --color --perl-regexp 'vmx|svm' /proc/cpuinfo
    sudo apt update
    sudo apt install -y qemu qemu-kvm qemu-system qemu-utils
    sudo apt install -y libvirt-clients libvirt-daemon-system virtinst
    sudo apt install -y virt-manager
    ```

    ```
    sudo systemctl status libvirtd
    sudo systemctl start libvirtd
    ```

    ```
    sudo adduser $(whoami) libvirt
    sudo adduser $(whoami) libvirt-qemu
    ```


16. Install Docker

    * [Debian 10 Docker - Digital Ocean](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-debian-10)

    ```bash
    # Install Docker
    sudo apt update
    sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    sudo apt update
    # apt-cache policy docker-ce
    sudo apt install docker-ce
    ```

    ```
    sudo systemctl start docker
    sudo systemctl status docker
    ```

    ```
    # Configure User
    sudo usermod -aG docker ${USER}
    # Activate by starting a new session (or log out and back in again)
    su - ${USER}
    # Check user is in group
    id -nG
    ```


---

## References

* https://www.digitalocean.com/community/tutorials/initial-server-setup-with-debian-10
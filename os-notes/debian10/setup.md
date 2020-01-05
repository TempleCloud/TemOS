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
nordvpn login
nordvpn connect
nordvpn status
nordvpn set autoconnect on
nordvpn set killswitch on
norvpn settings

firefox https://support.nordvpn.com/Connectivity/Linux/1325531132/Installing-and-using-NordVPN-on-Debian-Ubuntu-and-Linux-Mint.htm
```

9. Install git projects

```bash
temos/dotfiles/git/update-repos.sh
```

10. Delete any excess crud.

```bash
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
sudo apt purge -y --auto-remove totem
sudo apt purge -y --auto-remove shotwell
sudo apt purge -y --auto-remove rhythmbox
sudo apt purge -y --auto-remove simple-scan

sudo apt purge -y --auto-remove libreoffice-*

sudo apt purge -y --auto-remove fcitx-*
sudo apt purge -y --auto-remove uim-*
sudo apt purge -y --auto-remove mozc-*
sudo apt purge -y --auto-remove mlterm-*
sudo apt purge -y --auto-remove xiterm+thai
sudo apt purge -y --auto-remove im-config
sudo apt purge -y --auto-remove anthy kasumi
sudo apt purge -y --auto-remove goldendict

sudo apt purge -y --auto-remove aisleriot
sudo apt purge -y --auto-remove five-or-more
sudo apt purge -y --auto-remove four-in-a-row
sudo apt purge -y --auto-remove hitori
sudo apt purge -y --auto-remove iagno
sudo apt purge -y --auto-remove gnome-klotski
sudo apt purge -y --auto-remove gnome-mines
sudo apt purge -y --auto-remove gnome-robots
sudo apt purge -y --auto-remove gnome-mahjongg
sudo apt purge -y --auto-remove gnome-nibbles
sudo apt purge -y --auto-remove lightsoff
sudo apt purge -y --auto-remove gnome-sudoku
sudo apt purge -y --auto-remove gnome-tetravex
sudo apt purge -y --auto-remove swell-foop
sudo apt purge -y --auto-remove quadrapassel
sudo apt purge -y --auto-remove tali
sudo apt purge -y --auto-remove gnome-taquin

sudo apt purge -y --auto-remove hdate-applet
```







sudo apt-get clean
sudo apt-get autoremove







sudo apt purge -y --auto-remove mlterm
```






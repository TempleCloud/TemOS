# Windows 10 Setup

## Introduction

1. Some notes on configuring `Windows 10`.

---

## Setup - Look and Feel

1. Setup the [dark theme](https://www.youtube.com/watch?v=jGCdSeKEK1o) - Search for `color` and set the `dark` theme toggle.

---

## Setup - Privacy and Security

1. Disable all the `Windows 10` snooping features as appropriate under `Settings --> Privacy`.

    1. Also check the `Cortana` configuration.

2. Configure `Windows 10` patching and updates as appropriate under `Settings --> Update & Security`.

    1. Also check `Windows Security` configuration.

3. `Reduce privileges` of default user. Create a new personal user without `admin` privileges.

    1. Create a `local` account, that is not tied to the `Microsoft account`.

4. Install [`NordVPN`](https://nordvpn.com/download) and configure.

5. [Check Microsoft Account](https://account.microsoft.com/account/privacy?ref=privacy-windowssettings&ru=https%3A%2F%2Faccount.microsoft.com%2Fprivacy%3Fref%3Dprivacy-windowssettings&destrt=privacy-dashboard) - Clear and disable as appropriate.

---

## Setup - Tools

1. Pin `powershell` to start bar.

2. Install [Git](https://git-scm.com/downloads) - and create and register [PKI](https://help.github.com/en/enterprise/2.17/user/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent).

3. Install [Chocolatey](https://chocolatey.org) `package manager` and configure.

4. Install [Sandboxie](https://www.sandboxie.com) for a sandboxed browser.

5. Install [Visual Studio Code](https://code.visualstudio.com).

6. Enable `Windows Subsystem for Linux (WSL)`

    1. Search for `Control Panel`. then find `Programs --> Programs and Features --> Turn Windows features on or off`.

    2. Enable `Windows subsystem for Linux..

6. Install __Ubuntu Linux - Windows Subsystem for Linux (WSL)__

    1. Run, create user, `sudo apt update`, `sudo apt list --upgradeable`, `sudo apt upgrade`.

7. Install [Kali Linux - Windows Subsystem for Linux (WSL)](https://www.youtube.com/watch?v=8Qlq4GItKb4)

    1. Run, create user, `sudo apt update`, `sudo apt list --upgradeable`, `sudo apt upgrade`.

    2. Configure `Windows Defender` 

        1. Go to `C:\Users\$user\AppData\Local\Packages\`, find the package `KaliLinux` to configure as an `exclusion`, copy it's location.

        2. Search for `Windows Security`. Find `Virus and threat protection --> Manage Settings`.

        3. Add an `exclusion` path for the item.

        > NB: Add at you own risk! 

---

## Setup - Apps

1. Instal [Spottily]()


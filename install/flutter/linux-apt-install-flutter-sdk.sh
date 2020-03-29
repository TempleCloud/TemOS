#!/bin/bash

# https://flutter.dev/docs/get-started/install/linux
# https://flutter.dev/docs/development/tools/sdk/releases

# https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_v0.7.3-beta.tar.xz
# https://storage.googleapis.com/flutter_infra/releases/stable/windows/flutter_windows_v1.12.13+hotfix.8-stable.zip

#   ╔════════════════════════════════════════════════════════════════════════════╗
#   ║                 Welcome to Flutter! - https://flutter.dev                  ║
#   ║                                                                            ║
#   ║ The Flutter tool uses Google Analytics to anonymously report feature usage ║
#   ║ statistics and basic crash reports. This data is used to help improve      ║
#   ║ Flutter tools over time.                                                   ║
#   ║                                                                            ║
#   ║ Flutter tool analytics are not sent on the very first run. To disable      ║
#   ║ reporting, type 'flutter config --no-analytics'. To display the current    ║
#   ║ setting, type 'flutter config'. If you opt out of analytics, an opt-out    ║
#   ║ event will be sent, and then no further information will be sent by the    ║
#   ║ Flutter tool.                                                              ║
#   ║                                                                            ║
#   ║ By downloading the Flutter SDK, you agree to the Google Terms of Service.  ║
#   ║ Note: The Google Privacy Policy describes how data is handled in this      ║
#   ║ service.                                                                   ║
#   ║                                                                            ║
#   ║ Moreover, Flutter includes the Dart SDK, which may send usage metrics and  ║
#   ║ crash reports to Google.                                                   ║
#   ║                                                                            ║
#   ║ Read about data we send with crash reports:                                ║
#   ║ https://github.com/flutter/flutter/wiki/Flutter-CLI-crash-reporting        ║
#   ║                                                                            ║
#   ║ See Google's privacy policy:                                               ║
#   ║ https://www.google.com/intl/en/policies/privacy/                           ║
#   ╚════════════════════════════════════════════════════════════════════════════╝


function install() {
    pushd ${TEMOS_BIN}
    git clone https://github.com/flutter/flutter.git -b stable
    export PATH="$PATH:`pwd`/flutter/bin"
    flutter config --no-analytics
    flutter precache
    flutter doctor
    # Install Android Studio - Currently needs JDK8 set as $JAVA_HOME.
    popd
}

function tar-install() {
    # local version="v0.7.3-beta"
    local version="v1.12.13+hotfix.8"
    local binary="flutter_linux_${version}.tar.xz"
    local url="https://storage.googleapis.com/flutter_infra/releases/beta/linux/${binary}"

    if [ ! -f "${binary}" ]; then
        curl -O "${url}"
    fi

    tar xvf "${binary}"
    local install_dir="${TEMOS_BIN}"
    mv flutter "${install_dir}"

    sudo apt-get install -y lib32stdc++6

    # Remember to add 'flutter/bin' to path!
    PATH=${PATH}:"${TEMOS_BIN}/flutter/bin"
    flutter doctor

    rm -Rf "${binary}"
} && install


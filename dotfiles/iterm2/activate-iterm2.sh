#!/bin/bash

# References
#
# http://stratus3d.com/blog/2015/02/28/sync-iterm2-profile-with-dotfiles-repository/

# Configure iTerm2
#
function _activate() {
    local _dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    # Specify the preferences directory.
    defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${_dir}"
    # Tell iTerm2 to use the custom preferences in the directory.
    defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
} && _activate
#!/bin/bash
set -e

# Resources
#
# https://github.com/junegunn/fzf

# Install fzf
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
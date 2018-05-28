# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/Temple/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/Temple/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/Temple/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/Temple/.fzf/shell/key-bindings.bash"


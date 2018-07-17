# Setup fzf
# ---------
if [[ ! "$PATH" == */home/temple/.fzf/bin* ]]; then
  export PATH="$PATH:/home/temple/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/temple/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/temple/.fzf/shell/key-bindings.bash"


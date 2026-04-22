# Setup fzf
# ---------
if [[ ! "$PATH" == */home/reecaag/Downloads/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/reecaag/Downloads/bin"
fi

source <(fzf --zsh)

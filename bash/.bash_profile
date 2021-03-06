# Add Homebrew `/usr/local/bin` and User `~/bin` to the `$PATH`
PATH=/usr/local/bin:$PATH
PATH=$HOME/bin:$PATH
export PATH

EDITOR=/usr/bin/vim
export EDITOR

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

TEMPLC_CTYPE=$LC_CTYPE
export LC_CTYPE=C
if [ -x "$(command -v brew)" ]; then
    if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
        source "$(brew --prefix)/etc/bash_completion"
    fi
fi
LC_CTYPE=$TEMPLC_CTYPE

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

if alias base16_classic-light &>/dev/null; then
    base16_classic-light
else
    echo "Base 16 theme not found"
fi


# Append instead of overwrite history
shopt -s histappend
# Join multiline commands in history
shopt -s cmdhist
export HISTSIZE=10000
export HISTCONTROL=ignorespace
export HISTTIMEFORMAT='%F %T '

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Links from WSL to Windows
CDPATH=~/.paths

export PATH="$PATH:~/ngc-cli"
export PATH="$HOME/.local/nvim-linux-x86_64/bin:$PATH"

# Configuration for Windows X Server
export DISPLAY=host.docker.internal:0

alias openkitty='nohup kitty & disown'

rl() {
    source ~/.bashrc
    echo ".bashrc has been refreshed."
}

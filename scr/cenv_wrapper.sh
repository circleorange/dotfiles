# Wrapper for managing Conda environments (cenv)
#
# Usage:
#       > mkcenv <env_name> <python_ver> - Make new conda environment.
#       > cdcenv <env_name> - Change to conda environment.
#       > qcenv - Exit conda environment.
#       > rmcenv - Remove conda environment.
#       > lscenv - List existing conda environments.
#
#
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pbiel/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pbiel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pbiel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pbiel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Location of cenv directories
export CENV_HOME="$HOME/.conda/envs"

lscenv() {
    # List available Conda environments.
    conda env list
}

mkcenv() {
    # Create new Conda envrionment.
    local name=$1
    local v_python=${2:-}
    if [[ -z "$name" ]]; then
        echo "Usage: mkcenv <env_name> <python_version>"
        return 1
    fi
    if  [[ -z "$v_python" ]]; then
        conda create -y -n "$name"
    else
        conda create -y -n "$name" python="$v_python"
    fi
    conda activate "$name"
}

cdcenv() {
    # Change into Conda environment.
    local name=$1
    if [[ -z "$name" ]]; then
        echo "Failed Usage: cdcenv <env_name>"
        return 1
    fi
    conda activate "$name"
}

qcenv() {
    # Quit Conda environment.
    conda deactivate
}

rmcenv() {
    # Remove Conda environment.
    local name=$1
    if [[ -z "$name" ]]; then
        echo "Failed Usage: rmcenv <env_name>"
        return 1
    fi
    conda remove -y -n "$name" --all
}


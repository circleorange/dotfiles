# Clone `dotfiles` repository
# git clone git@github-pers:circleorange/dotfiles.git ~/repos/dotfiles

# Remove original files and Symlink files from `dotfiles` repo to `.config`.
# Changes in `dotfiles/` will be tracked by git and also reflected in `.config/`.

set -e

DOTFILES_DIR="$(pwd)"
CONFIG_DIR="$HOME/.config"

echo "Bootstraping dotfiles from $DOTFILES_DIR to $CONFIG_DIR"

# Iterate over all non-hiddenfiles and directories
for dotfile in "$DOTFILES_DIR"/*; do
    name="$(basename "$dotfile")"

    # Skip some files
    [[ "$dotfile" == ".git" ]] && continue
    [[ "$dotfile" == "dotfiles_bootstrap.sh" ]] && continue

    target="$CONFIG_DIR/$name"

    # Remove existing item
    if [ -e "$target" ] || [ -L "$target" ]; then
        echo "Removing existing $target"
        rm -rf "$target"
    fi

    # Create symlink
    echo "Linking $dotfile -> $target"
    ln -s "$dotfile" "$target"
done

echo "Completed creating dotfile symlinks in .config"

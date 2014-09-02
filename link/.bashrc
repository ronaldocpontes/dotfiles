
settings_file=~/.dotfiles.settings


# Add binaries into the path
PATH=~/.dotfiles/bin:$PATH
export PATH

if [[ -e $settings_file ]]; then
    echo "Load settings file at $settings_file"
    source "$settings_file"
fi


if [[ "$1" ]]; then
    echo
    echo "Setting DOTFILES_ENV to $1..."
    echo
    export DOTFILES_ENV=$1
fi


echo "======================================="
echo "       DOTFILES ENVIRONMENT            "
echo "       : $DOTFILES_ENV                "
echo "======================================="




function src() {
  local file

  echo "Sourcing files in  ~/.dotfiles/source/env/$DOTFILES_ENV"

  if [[ "$DOTFILES_ENV" ]]; then
    for file in ~/.dotfiles/source/env/$DOTFILES_ENV/*; do
      if [[ ! -d $file ]]; then
        #echo "- $file ..."
        source "$file"
      fi
    done
  fi


  echo "Sourcing files in  ~/.dotfiles/source"

  for file in ~/.dotfiles/source/*; do
    if [[ ! -d $file ]]; then
        #echo "- $file ..."
        source "$file"
    fi
  done
}


function save_config() {

    >| $settings_file  # erase settings file

    if [[ "$DOTFILES_ENV" ]]; then
        declare -p DOTFILES_ENV | cut -d ' ' -f 3- >> $settings_file
    fi
}

# Run dotfiles script, then source.
function dotfiles() {
  ~/.dotfiles/bin/dotfiles "$@" && src
}

src
save_config
### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

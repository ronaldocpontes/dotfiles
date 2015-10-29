# OSX-only stuff. Abort if not OSX.
[[ "$OSTYPE" =~ ^darwin ]] || return 1

# APPLE DEFAULT PATH (from bash_profile)
PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:${PATH}
export PATH

# Make 'less' more.
eval "$(lesspipe.sh)"

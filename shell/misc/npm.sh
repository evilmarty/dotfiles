# Add NPM to path if available
if [ -d $HOME/node_modules ]; then
  export PATH="$PATH:$HOME/node_modules/.bin"
fi


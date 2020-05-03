#!/bin/sh

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
  # assume zsh
  rc=~/.zshrc
  sh="zsh"

elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
  # assume bash
  rc=~/.bashrc
  sh="bash"

fi

setup_color() {
	# only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		CYAN=$(printf '\033[36m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		CYAN=""
		RESET=""
	fi
}

error() {
	echo ${RED}"$@"${RESET} >&2
}

success() {
	echo ${GREEN}"$@"${RESET} >&2
}

cyan() {
  echo ${CYAN}"$@"${RESET} >&2
}

# tell the user what's going on
setup_color
cyan "Setting up exp"

# clone the project (uncomment the following for production)
cd ~/ || exit
rm -rf ".exp"
git clone --depth=1 "https://github.com/malcolmkiano/exp.git" ".exp"
cd - # go back to where we were before
echo

# local testing code (uncomment the following for local development)
# rm -rf ~/.exp
# mkdir ~/.exp
# cp -ar ./ ~/.exp
# sleep 1s

# install it in the corresponding shell
cyan "Installing exp"
chmod +x ~/.exp/exp.sh
cat >> $rc << EOT
alias exp='~/.exp/exp.sh'
EOT
echo
sleep 1s

# we're golden
success "Installation was successful. Your terminal settings have been reloaded."
echo
echo "To use: ${CYAN}exp ${GREEN}project-name${RESET} ${CYAN}'project description'${RESET} [-options]"
echo "To view help, run: ${CYAN}exp -h${RESET}"

exec "$sh"
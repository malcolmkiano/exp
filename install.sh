#!/bin/sh

if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
  # assume zsh
  # set paths for zsh files
  profile=~/.zprofile
  rc=~/.zshrc
  rcname="zshrc"
  sh="zsh"

elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
  # assume bash
  # set paths for bash files
  profile=~/.bash_profile
  rc=~/.bashrc
  rcname="bashrc"
  sh="bash"

fi

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		CYAN=$(printf '\033[36m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		CYAN=""
		BOLD=""
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

setup_color

cyan "Setting up exp"
sleep 2s
cd ~/ || exit
# clone the project
git clone --depth=1 "https://github.com/malcolmkiano/exp.git" ".exp"
sleep 2s
# install it in the necessary shell
echo "installing exp"
chmod +x ~/.exp/shell/rc.sh
cat >> $rc << EOT
alias exp='~/.exp/shell/rc.sh'
EOT

# bottom line
success "Installation was successful. Open a new terminal to use."
echo
success "To use: exp [-k] ${BOLD}project name${RESET} ${CYAN}'project description'${RESET}"
error "To view help, run: ${CYAN}exp -h${RESET}"

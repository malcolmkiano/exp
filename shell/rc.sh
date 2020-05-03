#!/bin/sh

# exp v1.0
# developed by Malcolm Kiano (https://malcolmkiano.com)

setup_color() {
	# Only use colors if connected to a terminal
	if [ -t 1 ]; then
		RED=$(printf '\033[31m')
		GREEN=$(printf '\033[32m')
		YELLOW=$(printf '\033[33m')
		BLUE=$(printf '\033[34m')
		CYAN=$(printf '\033[36m')
		BOLD=$(printf '\033[1m')
		RESET=$(printf '\033[m')
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
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

bold() {
  echo ${BOLD}"$@"${RESET} >&2
}

cyan() {
  echo ${CYAN}"$@"${RESET} >&2
}


exp() {
  setup_color
  # replace this value with the url to your express/express-knex boilerplate
  defaulturl="https://github.com/malcolmkiano/express-boilerplate.git"
  defaulturl_knex="https://github.com/malcolmkiano/express-knex-boilerplate.git"

  # replace this value with the value in "name" in your boilerplate's package.json
  defaultname="express-boilerplate"
  defaultname_knex="express-knex-boilerplate"

  # replace this value with the value in "description" in your boilerplate's package.json
  defaultdesc="A starting point for Express apps"
  defaultdesc_knex="A starting point for Express apps with Knex and a PostgreSQL Database"

  # You can also run this without changing the values, and it'll start up a project based off one of my boilerplates
  # at https://github.com/malcolmkiano/express-boilerplate
  # or https://github.com/malcolmkiano/express-knex-boilerplate

  # Don't change anything beyond this line ======================================
  url="$defaulturl"
  name="$defaultname"
  desc="$defaultdesc"

  # Display Help for -h option
  Help(){
    echo "Creates an Express JS app using '$defaultname' repo at $url"
    echo
    success "${BOLD}Syntax:${RESET} ${BOLD}project name${RESET} ${CYAN}'project description'${RESET} -options"
    success "Example ${CYAN}exp express-app 'an app with an awesome description'${RESET}"
    echo "Options:"
    echo "k   Scaffold an Express app with Knex" 
    echo "h   Print this help."
  }

  while getopts ":hk" option; do
    case $option in
      h) # display Help
        Help
        return 0;;
      k)
        url="$defaulturl_knex"
        name="$defaultname_knex"
        desc="$defaultdesc_knex";;
      \?) # incorrect option
        echo "Usage: exp [-h|-k]"
        return 1;;
    esac
    shift $((OPTIND -1));
  done

  # check if name is empty
  if [ -z "$1" ]
  then

    # can't run without project name
    error "Must provide project name"
    success "${BOLD}Syntax:${RESET} ${BOLD}project name${RESET} ${CYAN}'project description'${RESET} -options"
    return 1
  
  else

    # get the values
    projectname="$1"

    # check validity of project name
    if [[ "$projectname" =~ [A-Za-z0-9_-]+$ ]]
    then

      :

    else

      error "Project name '$projectname' includes illegal characters"
      return 1

    fi

    if [ -n "$2" ]
    then
      description="$2"
    else
      description="An Express app"
    fi

    # get it going
    echo
    success "Starting up a new project using the ${CYAN}$name${RESET} repo"
    echo
    sleep 2s

    # clone the repository & cd into it

    git clone --depth=1 "$url" "$projectname"
    cd "$projectname" || exit

    # reinitialize repo
    success "Reinitialize git repo"
    rm -rf .git && git init

    # install the packages
    npm install

    # move the env file
    mv example.env .env

    # replace the title and description in package.json
    sed -i "s/$name/$projectname/g" package-lock.json
    sed -i "s/$name/$projectname/g" package.json
    sed -i "s/$desc/$description/g" package.json

    # clean up README.md
    echo "# $projectname" > README.md
    echo "$description" >> README.md

    # get out of there!
    cd ..

    # tell them how to start
    echo
    echo "To get started:"
    cyan "  cd $projectname"
    cyan "  npm start"

    # let's rock & roll, baby
    echo
    success "Let's get it! ${CYAN}#Express${RESET}"
    echo

    return 0

  fi

}

exp "$@"
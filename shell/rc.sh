# exp v1.0
# developed by Malcolm Kiano (https://malcolmkiano.com)
exp() {

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
    echo "Creates a clone of the '$defaultname' repo at $url"
    echo
    echo -e "\e[32mSyntax:\e[0m  exp [-k] \e[36mproject-name \e[0m['Project description']"
    echo "options:"
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
    echo -e "\e[31mMust provide project name"
    echo -e "\e[32mSyntax:\e[0m  exp [-k] \e[36mproject-name \e[0m['Project description']"
    return 1
  
  else

    # get the values
    projectname="$1"

    # check validity of project name
    if [[ "$projectname" =~ [A-Za-z0-9_-]+$ ]]
    then

      :

    else

      echo -e "Project name '\e[31m$projectname\e[0m' includes illegal characters"
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
    echo -e "Starting up a new project using the \e[32m$name\e[0m repo"
    echo
    sleep 2s

    # clone the repository & cd into it
    git clone "$url" "$projectname"
    cd "$projectname"

    # reinitialize repo
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
    echo $description >> README.md

    # get out of there!
    cd ..

    # tell them how to start
    echo
    echo "To get started:"
    echo -e "  \e[36mcd $projectname\e[0m"
    echo -e "  \e[36mnpm start\e[0m"

    # let's rock & roll, baby
    echo
    echo -e "\e[1mLet's get it!\e[0m \e[32m#Express"
    echo

    return 0

  fi

}
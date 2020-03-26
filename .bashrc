# exp v1.0
# developed by Malcolm Kiano (https://malcolmkiano.com)
exp() {

  # replace this value with the url to your express boilerplate
  url="https://github.com/malcolmkiano/express-boilerplate.git"

  # replace this value with the value in "name" in your boilerplate's package.json
  defaultname="express-boilerplate"

  # replace this value with the value in "description" in your boilerplate's package.json
  defaultdesc="A starting point for Express apps"

  # You can also run this without changing the values, and it'll start up a project based off my boilerplate
  # at https://github.com/malcolmkiano/express-boilerplate

  # Display Help for -h option
  Help(){
    echo "Creates a clone of the '$defaultname' repo at $url"
    echo
    echo -e "\e[32mSyntax:\e[0m  exp \e[36mproject-name \e[0m['Project description']"
    echo "options:"
    echo "h     Print this help."
    echo
  }

  while getopts ":h" option; do
    case $option in
      h) # display Help
        Help
        return 0;;
      \?) # incorrect option
        echo "Usage: exp [-h]"
        return 1;;
    esac
  done
  shift $((OPTIND -1))

  # check if name is empty
  if [ -z "$1" ]
  then

    # can't run without project name
    echo -e "\e[31mMust provide project name"
    echo -e "\e[32mSyntax:\e[0m  exp \e[36mproject-name \e[0m['Project description']"
    return 1
  
  else

    # get the values
    projectname="$1"

    if [ -n "$2" ]
    then
      description="$2"
    else
      description="An Express app"
    fi

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
    sed -i "s/$defaultname/$projectname/g" package.json
    sed -i "s/$defaultdesc/$description/g" package.json

    # clean up README.md
    echo "# $projectname" > README.md
    echo $description >> README.md

    # let's rock & roll, baby
    echo
    echo -e "Let's get it! \e[32m#Express"
    echo

    return 0

  fi

}
# exp
A simple bash/zsh script to make starting up a new Express app a breeze!

## Prerequisites
You need to have [node/npm](https://nodejs.org/en/) and [git](https://www.atlassian.com/git/tutorials/install-git) installed on your local machine and available in your PATH.

## Installation
1. Clone this repository onto your local machine and `cd` into it.
2. Run the `install` file in the terminal - (the `./` is required).
```shell
./install
```

You're done, and you only ever have to do this once!

## Usage
To use this, `cd` into your projects folder (or wherever really), and run the following command:
```bash
exp your-project-name
```

You could optionally include a description for your project:
```bash
exp your-project-name "Your project description"
```

For help using exp, use the `-h` option:
```bash
exp -h
```


## Configuration
You can configure this to clone your own Express boilerplate repo!<br>
All you need to do is edit the variables below _(located in your `.bashrc` or `.zshrc` file)_

```bash
# replace this value with the url to your express boilerplate
url="https://github.com/malcolmkiano/express-boilerplate.git"

# replace this value with the value in "name" in your boilerplate's package.json
defaultname="express-boilerplate"

# replace this value with the value in "description" in your boilerplate's package.json
defaultdesc="A starting point for Express apps"
```

If you don't change these values, it'll start you off with [my Express boilerplate](https://github.com/malcolmkiano/express-boilerplate), which is good too. 😅
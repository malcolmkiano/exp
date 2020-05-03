# exp
A simple bash/zsh script to make starting up a new Express app a breeze!

## Prerequisites
You need to have [node/npm](https://nodejs.org/en/) and [git](https://www.atlassian.com/git/tutorials/install-git) installed on your local machine and available in your PATH.<br>
For usage with Knex: you also need to have [PostgreSQL](https://www.postgresql.org) set up on your machine.

## Using it once:
If you just need to use the script without installing it:
> To be run in the terminal

Wget
```shell
bash -c "$(wget -O - https://raw.githubusercontent.com/malcolmkiano/exp/master/exp.sh)" <project name> <"project description">
```
Curl
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/malcolmkiano/exp/master/exp.sh)" <project name> <"project description">
```
Replace `<project name>` and `<project description>` with your project name and description

## Installation
> To be run in the terminal

Wget
```shell
bash -c "$(wget -O - https://raw.githubusercontent.com/malcolmkiano/exp/master/install.sh)"
```
Curl
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/malcolmkiano/exp/master/install.sh)"
```

You're done, go ahead and run `exp`!

## Usage
To use this, `cd` into your projects folder (or wherever really), and run the following command:
```bash
exp your-project-name
```

You could optionally include a description for your project:
```bash
exp your-project-name "Your project description"
```
<br>

This will scaffold an Express app for you. If you would like a template with [Knex](http://knexjs.org/), use the `-k` option:
```bash
exp -k your-project-name
```
<br>

For help using exp, use the `-h` option:
```bash
exp -h
```


## Configuration _(not recommended)_
You can configure this to clone your a different repository and set it up for you.<br>
It is highly likely it won't entirely be compatible, so please make sure you know what you're doing.

To change the source repos, edit the variables below _(located in `~/.exp/exp.sh`)_

```bash
# replace value with the url to your express/express-knex boilerplate
defaulturl="https://github.com/malcolmkiano/express-boilerplate.git"
defaulturl_knex="https://github.com/malcolmkiano/express-knex-boilerplate.git"

# replace value with the value in "name" in your boilerplate's package.json
defaultname="express-boilerplate"
defaultname_knex="express-knex-boilerplate"

# replace value with the value in "description" in your boilerplate's package.json
defaultdesc="A starting point for Express apps"
defaultdesc_knex="A starting point for Express apps with Knex and a PostgreSQL Database"
```

If you don't change these values, it'll start you off with my [Express boilerplate](https://github.com/malcolmkiano/express-boilerplate) or [Express-Knex boilerplate](https://github.com/malcolmkiano/express-knex-boilerplate), both of which are really good starting points.

# exp
A simple bash script to make starting up a new Express app a breeze!

## Installation
Download `.bash_profile` and `.bashrc` and place them in your home directory.<br>
For example:
- Windows: *`'C:/Users/John/'`*
- Mac/Linux: *`'/Users/John'`*

Restart any terminals you have open.

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
All you need to do is edit the variables below _(located in your `.bashrc` file)_

```bash
# replace this value with the url to your express boilerplate
url="https://github.com/malcolmkiano/express-boilerplate.git"

# replace this value with the value in "name" in your boilerplate's package.json
defaultname="express-boilerplate"

# replace this value with the value in "description" in your boilerplate's package.json
defaultdesc="A starting point for Express apps."
```
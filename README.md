# exp
A simple bash script to make starting up a new Express app a breeze!

## Installation
Copy the code from `.bash_profile` and `.bashrc` and add them to the same files in your home directory. Create these files if they do not exist.<br>
For example:
- Windows: `'C:/Users/John/.bashrc'` and `'C:/Users/John/.bash_profile'`
- Mac/Linux: `'/Users/John/.bashrc'` and `'/Users/John/.bash_profile'`

**NOTE:** You could also just download these files and replace your local ones, however **this WILL overwrite your current settings**. Only go with this if you know what you're doing.

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
defaultdesc="A starting point for Express apps"
```

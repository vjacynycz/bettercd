[![GitHub Release](https://img.shields.io/github/release/vjacynycz-stratio/bettercd.svg)](https://github.com/vjacynycz-stratio/bettercd/releases)
[![GitHub License](https://img.shields.io/github/license/vjacynycz-stratio/bettercd.svg)](https://github.com/vjacynycz-stratio/bettercd/blob/master/LICENSE)
[![GitHub Maintainer](https://img.shields.io/badge/maintainer-vjacynycz--stratio-success.svg)](https://github.com/vjacynycz-stratio)
# bettercd - Jump to directories using partial path names
Bettercd allows users to jump to long and complicated paths using a fraction of the directory names. Better cd also allows to concatenate fragments of a path (see examples bellow).

# Installation

Download this repo to your machine.

Create `.bettetcd` directory under `$HOME`. Bettercd full path should be `$HOME/.bettercd`.

Copy this repo files to  `$HOME/.bettercd`.

Run `./install.sh`.

# Usage

Default cd behaviour
```bash
cd DIR
```

Jump to a directory under `$BETTERCDROOT` matching *PATTERN* or each *PATTERN* separated by `/` (see <a href="#description">Description</a>).
```bash
cd PATTERN
cd PATTERN [PATTERN] ... [PATTERN]
```


Jump to a directory under `$PWD` matching *PATTERN* or each *PATTERN* separated by `/` (see <a href="#description">Description</a>).  `cdd` only works if the current directory is under `$BETTERCDROOT`.
```bash
cdd PATTERN
cdd PATTERN [PATTERN] ... [PATTERN]
```

# Description

Change the current directory to DIR.  The default DIR is the value of the HOME shell variable.

Better cd allows to use patterns to jump into long paths.

Given the following structure:

* /home/vik/projects/reallycoolproject
* /home/vik/projects/niceproject
```bash
cd proj rea # will go to reallycoolproject
cd p ni # will go to niceproject
cd pro # will go to projects
cd pr pro # will go to niceproject
```
cdd works similar to cd but instead of calculating the jump over the BETTERCDROOT var uses the current directory.


Given the following structure:

* /home/vik/projects/reallycoolproject/pro/vars
* /home/vik/projects/reallycoolproject/pro/bin
* /home/vik/projects/niceproject

And if `PWD=/home/vik/projects/reallycoolproject`

```bash
cd pro # will go to projects
cdd pro # will go to reallycoolproject/pro
```

# Command line options

- `--updateroot`: Updates the root directory from which better cd calculates jumps. Default directory is `$HOME` (to restore default location run `cd --updateroot $HOME`).
- `--cache`: Updates the cache file, this is usefull if you want to be able to jump inside directories you just created.
- `--help|-h`: Show bettercd man page.
- `-l`: List cache contents. Works similar to cd but it shows a list of possible jump locations (bettercd always chooses the first shown).
- `-|--`: Changes the working directory to the previous working directory.

# Bugs

No known bugs. If you find one, please go to https://github.com/vjacynycz-stratio/bettercd/issues

# Author 

Viktor Jacynycz (viktor@jacynycz.es) - Contact viktor@jacynycz.es to correct errors or typos.

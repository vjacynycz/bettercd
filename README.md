# bettercd
Jump to directories using partial path names

# Usage

cd DIR
cd PATTERN [PATTERN | PATTERN ...]
cdd PATTERN [PATTERN | PATTERN ...]

# Description

Change the current directory to DIR.  The default DIR is the value of the HOME shell variable.

Better cd allows to use patterns to jump into long paths.

Given the following structure:

/home/vik/projects/reallycoolproject"
/home/vik/projects/niceproject
```bash
cd proj rea # will go to reallycoolproject
cd p ni # will go to niceproject
cd pro # will go to projects/
cd pr pro # will go to niceproject
```
cdd works similar to cd but instead of calculating the jump over the BETTERCDROOT var uses the current directory.


Given the following structure:

/home/vik/projects/reallycoolproject/pro/vars
/home/vik/projects/reallycoolproject/pro/bin
/home/vik/projects/niceproject

And if `PWD=/home/vik/projects/reallycoolproject`

```bash
cd pro # will go to projects/
cdd pro # will go to reallycoolproject/pro/
```

# Bugs

No known bugs. If you find one, please go to https://github.com/vjacynycz-stratio/bettercd/issues

# Athor 

Viktor Jacynycz (viktor@jacynycz.es) - Contact viktor@jacynycz.es to correct errors or typos.

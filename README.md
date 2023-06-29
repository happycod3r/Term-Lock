# Term-Lock v1.0.0

## About

Term-Lock is a simple pin system that allows you to block access and add a layer of security to your terminal.
This is achieved by adding the following line to the top of your ***.bashrc*** or ***.zshrc*** file:

### Bash

```bash
# Put the term-lock folder where you would like then update the $TERM_LOCK variable
# with the new path
TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.sh" ]] && source "${TERM_LOCK}/term-lock.sh"
```

### Zsh

```bash
# Put the term-lock folder where you would like then update the $TERM_LOCK variable
# with the new path
TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.sh" ]] && builtin source "${TERM_LOCK}/term-lock.zsh"
```

Once the `term-lock.sh` script is sourced at the top of your ***.bashrc*** or ***.zshrc*** you will now have to enter a 4 digit pin when you start the terminal.
On the first run you will be asked to setup the pin. It should be only 4 digits long with no letters or characters.

## Notes 

This is by no means a full proof way to stop a person from accessing your termnal. Anyone who knows what they are doing will still be able to get access. On the other hand the majority of people who don't really know much about computers aside from the basics like your little brother or family member for example will be stopped by this.
Either way it adds a layer of security so it's always beneficial.

In the future I will add an option to lengthen or shorten the pin for better security.

# Term-Lock v1.0.0

```bash
 _______  ______  _____   __  __          _        ____    _____  _  __
|__   __||  ____||  __ \ |  \/  |        | |      / __ \  / ____|| |/ /
   | |   | |__   | |__) || \  / | ______ | |     | |  | || |     | ' / 
   | |   |  __|  |  _  / | |\/| ||______|| |     | |  | || |     |  <  
   | |   | |____ | | \ \ | |  | |        | |____ | |__| || |____ | . \ 
   |_|   |______||_|  \_\|_|  |_|        |______| \____/  \_____||_|\_\
                                                   
```
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

## [Contributing](#contributing)

If you have any feature requests, suggestions or general questions you can reach me via any of the methods listed below in the [Contacts](#contacts) section.

---

## [Security](#security)

### Reporting a vulnerability or bug?

**Do not submit an issue or pull request**: A general rule of thumb is to never publicly report bugs or vulnerabilities because you might inadvertently reveal it to unethical people who may use it for bad. Instead, you can email me directly at: [paulmccarthy676@gmail.com](mailto:paulmccarthy676@gmail.com). I will deal with the issue privately and submit a patch as soon as possible.

---

## [Contacts](#contacts)

**Author:** Paul M.

* Email: [paulmccarthy676@gmail.com](mailto:paulmccarthy676@gmail.com)
* Github: [https://github.com/happycod3r](https://github.com/happycod3r)
* Linkedin: [https://www.linkedin.com/in/paul-mccarthy-89165a269/]( https://www.linkedin.com/in/paul-mccarthy-89165a269/)
* Facebook: [https://www.facebook.com/paulebeatz]( https://www.facebook.com/paulebeatz)

---

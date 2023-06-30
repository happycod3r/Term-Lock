# Term-Lock v1.0.0

```bash
 _______  ______  _____   __  __          _        ____    _____  _  __
|__   __||  ____||  __ \ |  \/  |        | |      / __ \  / ____|| |/ /
   | |   | |__   | |__) || \  / | ______ | |     | |  | || |     | ' / 
   | |   |  __|  |  _  / | |\/| ||______|| |     | |  | || |     |  <  
   | |   | |____ | | \ \ | |  | |        | |____ | |__| || |____ | . \ 
   |_|   |______||_|  \_\|_|  |_|        |______| \____/  \_____||_|\_\
                                                   
```
## [About](#about)

Term-Lock is a simple pin system that allows you to block access and add a layer of security to your terminal.
You can use this as a stand-alone script or integrate it easily into anything else. Since Term-Lock is wrapped into one function it only needs to be called to work, so you can place it wherever you want. If you have some functionality or code that you want to protect, simply place a call to `term_lock` before it and this will put a barrier between what you want to protect and unauthorized usage and you will now need a pin to continue the control flow. 

For example check out this hypothetical function call stack: 
```bash
init
set_up_data
do_stuff
do_more_stuff
term_lock
pass_ctrl_to_user
```
In the above example you will now no longer be able to reach `pass_ctrl_to_user` without entering the correct pin effectivley holding back unauthorized usage.

---

## [Usage](#usage)


**Bash**

1) To use term-lock add the following line to the top of your ***.bashrc*** or ***.zshrc*** file.

```bash
# Put the term-lock folder where you would like then update the $TERM_LOCK variable
# with the new path
TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.sh" ]] && { source "${TERM_LOCK}/term-lock.sh"; term_lock; }
```

**Zsh**

```bash
# Put the term-lock folder where you would like then update the $TERM_LOCK variable
# with the new path
TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.sh" ]] && { builtin source "${TERM_LOCK}/term-lock.zsh"; term_lock; }
```

Once the `term-lock.sh` script is sourced at the top of your ***.bashrc*** or ***.zshrc*** you will now have to enter a 4 digit pin when you start the terminal.
On the first run you will be asked to setup the pin. It should be only 4 digits long with no letters or characters.

If you want to reset your pin change the line above where the `term_lock` function is called by passing it ***"true"*** as an argument like so:

```bash
   TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.sh" ]] && { source "${TERM_LOCK}/term-lock.sh"; term_lock "true"; }
```

Once you finish resetting your pin remove the ***"true"*** so that you don't reset your pin over and over.

```bash 
#Change 
term_lock "true"
#to...
term_lock


```

### Integration
 
You can also integrate Term-Lock easily into anything really by copying the function and placing it where you would like. For integration purposes there is also the `$USE_PIN` variable, which by default is set to `true`.
You can set it to `false` to turn off Term-lock and bypass the pin. In this way it acts as a switch that you can easily write some code to turn on/off based on whatever conditions.

```bash 
if [[ $some_condition == "true" ]]; then
   # Won't ask for pin next time around.
   USE_PIN="false"
elif [[ $some_condition == "false" ]]; then
   # Block access, ask for pin.
   USE_PIN="true"
fi
```

---

## [Notes](#notes) 

This is by no means a full proof way to stop a person from accessing your termnal. Anyone who knows what they are doing will still be able to get access. On the other hand the majority of people who don't really know much about computers aside from the basics like your little brother or family member for example will be stopped by this.
Either way it adds a layer of security so it's always beneficial.

In the future I will add an option to lengthen or shorten the pin for better security.

---

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

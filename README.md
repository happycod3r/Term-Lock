# Term-Lock v1.0.0

```bash
 _______  ______  _____   __  __          _        ____    _____  _  __
|__   __||  ____||  __ \ |  \/  |        | |      / __ \  / ____|| |/ /
   | |   | |__   | |__) || \  / | ______ | |     | |  | || |     | ' / 
   | |   |  __|  |  _  / | |\/| ||______|| |     | |  | || |     |  <  
   | |   | |____ | | \ \ | |  | |        | |____ | |__| || |____ | . \ 
   |_|   |______||_|  \_\|_|  |_|        |______| \____/  \_____||_|\_\
                                                   
```
> If you need to stop unauthorized access to your terminal Term-Lock is a simple solution

## [About](#about)

Term-Lock is a simple 1 way authentification system that allows you to block access and add a layer of security to your terminal by prompting for a pin which is then encrypted and stored on the system in a hidden file and folder.

You can use this as a stand-alone script or integrate it easily into anything else. Since Term-Lock is wrapped into one function, it's all that needs to be called to work and you can place the call to term_lock wherever you want. If you have some functionality you want to block or a route in the control flow of your code you want to protect and secure access to, just place a call to `term_lock` before it, and this will put a barrier between what you want to protect and unauthorized usage. You will now need a pin to continue the control flow or move on in any instance. 

I do plan on building on this in the near future to make it more secure with better encryption methods and functionality in general. I also plan on adding the option to change the pin size for tighter security. Right now though, Term-Lock v1.0.0 works well, is lightweight, and easy to use.  

For example check out this hypothetical function call stack: 
```bash
init               # 1) called 1st
set_up_data        # 2) called 2nd
do_stuff           # 3) called 3rd
do_more_stuff      # 4) called 4th
term_lock          # 5) prompts for the pin
pass_ctrl_to_user  # 6) If wrong/no pin entered in step 5 this never gets called.
```
In the above example you will now no longer be able to reach `pass_ctrl_to_user` without entering the correct pin holding back unauthorized usage.

Placing the call at the top of your ***.zshrc*** or your ***.bashrc*** will have the same effect as above effectively locking down your terminal by blocking further execution unless you have the pin. Follow the [usage](#usage) section below to set it up.

---

## [Installation](#installation)

To download and install Term-Lock follow these steps

1) Pick a directory to download it to:
```bash
cd where/I/want/
```

2) Paste the following line into your terminal and press the `Enter (^M)` key:
```bash
curl https://github.com/happycod3r/Term-Lock.git
```

## [Usage](#usage)


**Bash**

1) To use term-lock to create a pin and lock down access to your terminal add the following code to the very top of your ***.bashrc*** or ***.zshrc*** file.

```bash
# Put the term-lock folder where you would like then update the $TERM_LOCK variable
# with the new path
TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.sh" ]] && { source "${TERM_LOCK}/term-lock.sh"; term_lock; }

# Everything else ...
```

**Zsh**

```bash
# Put the term-lock folder where you would like then update the $TERM_LOCK variable
# with the new path
TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.zsh" ]] && { builtin source "${TERM_LOCK}/term-lock.zsh"; term_lock; }

# Everything else ...
```

Once the `term-lock.sh` script is sourced at the top of your ***.bashrc*** or ***.zshrc*** you will now have to enter a 4 digit pin when you start the terminal.
On the first run you will be asked to setup the pin. It should be only 4 digits long with no letters or characters.

If you want to reset your pin change the line above where the `term_lock` function is called by passing it ***"true"*** as an argument like so:

```bash
   TERM_LOCK="~/term-lock"
[[ -f "${TERM_LOCK}/term-lock.zsh" ]] && { builtin source "${TERM_LOCK}/term-lock.zsh"; term_lock "true"; }
```

Once you finish resetting your pin remove the value ***"true"*** that you added so that you don't reset your pin over again by accident.

You can also alternatively manually delete the `.pin.conf` file created by Term-Lock to hard reset your pin.
Since Term-Lock uses this file as a flag, it will prompt you to create a new pin when it doesn't detect it.


```bash 
#Change 
term_lock "true"
#to...
term_lock


```

You can use term_lock in many ways. Here's some examples:

```bash
if [[ $login == "true" ]]; then
   term_lock

```

### Integration
 
You can also integrate Term-Lock easily into anything really by copying the function and placing it where you would like or sourcing it as described in the beginning of this section.

For integration purposes there is the `$USE_PIN` variable, which by default is set to `true`.
You can set it to `false` to turn off Term-lock and bypass the pin. In this way it acts as a switch that you can easily write some code to turn on/off based on whatever conditions. 

```bash 
if [[ $some_condition == "true" ]]; then
   # Won't ask for pin next time around.
   USE_PIN="false"
elif [[ $some_condition == "false" ]]; then
   # Block access, ask for pin on next run.
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


# Linux Custom Settings

That repository contains some custom linux configuration files.


## Configuration Files
In computing, **configuration files** (or **config files**) are files used to configure the parameters and initial settings for some computer programs. They are used for user applications, server processes and operating system settings.

Some applications provide tools to create, modify, and verify the syntax of their configuration files; these sometimes have graphical interfaces. For other programs, system administrators may be expected to create and modify files by hand using a text editor; possible because many are human-editable plain texts. For server processes and operating-system settings, there is often no standard tool, but operating systems may provide their own graphical interfaces such as YaST or debconf.

Some computer programs only read their configuration files at boot process. Others periodically check the configuration files for changes. Users can instruct some programs to re-read the configuration files and apply the changes to the current process, or indeed to read arbitrary files as a configuration file. There are no definitive standards or strong conventions.

### Unix and Unix-like operating systems

Across Unix-like operating systems many different configuration-file formats exist, with each application or service potentially having a unique format, but there is a strong tradition of them being in human-editable plain text, and a simple key-value pair format is common. Filename extensions of `.cnf`, `.conf`, `.cfg`, `.cf` or as well `.ini` and similar are often used.

System-wide software often uses configuration files stored in `/etc`, while user applications often use a "dotfile" – a file or directory in the home directory prefixed with a period, which in Unix hides the file or directory from casual listing.

Some configuration files run a set of commands upon startup. A common convention is for such files to have "**rc**" in their name, typically using the name of the program then an "**(.)rc**" suffix e.g. `.xinitrc`, `.vimrc`, `.bashrc`, `xsane.rc`.


## Automatic Configuration Usage

```
$ git clone https://github.com/gustavocelani/linux_custom_settings.git
$ cd ./linux_custom_settings
$ chmod +x auto_config.sh
$ ./auto_config.sh
```

![Alt text](auto_config_usage.png?raw=true "Automatic Configuration Usage")

### Tested on

* Kali Linux 2020.2
* Kali Linux 2020.3



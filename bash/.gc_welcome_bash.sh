#!/bin/bash

###############################################################################
#
#       Filename:  .gc_welcome_bash.sh
#
#    Description:  Custom GC welcome message for bash.
#
#        Version:  1.0
#        Created:  12/10/2020 13:50:27 PM
#       Revision:  1
#
#         Author:  Gustavo P de O Celani
#                  github.com/gustavocelani/
#                  linkedin.com/in/gustavocelani/
#
################################################################################

# Colors definitions
red="\033[0;31m"
green="\033[0;32m"
yellow="\033[0;33m"
default_color="\033[0m"

# Layout colors
wolf_color=$green
wolf_eye_color=$red
welcome_color=$red
system_status_color=$default_color
warning_color=$yellow

# Welcome Message
welcome_msg="Welcome, $(whoami)"
# Current Date
current_date=`date +"%A, %e %B %Y, %r"`
# System Info
sys_info=`uname -srmo`

# Uptime
upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
secs=$((${upSeconds}%60))
mins=$((${upSeconds}/60%60))
hours=$((${upSeconds}/3600%24))
days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh:%02dm:%02ds" "$days" "$hours" "$mins" "$secs"`

# Path
path=$(pwd)
# Memory
mem_info="`cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB"
# Load Average
read one five fifteen rest < /proc/loadavg
# Running Proccess
running_proccess=`ps ax | wc -l | tr -d " "`
# IP Info
ip_info=`ip a | grep glo | awk '{print $2}' | head -1 | cut -f1 -d/`

print_wolf() {
    echo -e "${wolf_color}                               __"
    echo -e "${wolf_color}                             .d\$\$b"
    echo -e "${wolf_color}                           .' TO$;\\"
    echo -e "${wolf_color}                          /  : TP._;"
    echo -e "${wolf_color}                         / _.;  :Tb|"
    echo -e "${wolf_color}                        /   /   ;j\$j"
    echo -e "${wolf_color}                    _.-\"       d\$\$\$\$"
    echo -e "${wolf_color}                  .' ${wolf_eye_color}..${wolf_color}       d\$\$\$\$;"
    echo -e "${wolf_color}                 /  ${wolf_eye_color}/P'${wolf_color}      d\$\$\$\$P. |\\"
    echo -e "${wolf_color}                /   ${wolf_eye_color}\"${wolf_color}      .d\$\$\$P' |\^\"l"
    echo -e "${wolf_color}              .'           \`T\$P^\"\"\"\"\"  :"
    echo -e "${wolf_color}          ._.'      _.'                ;"
    echo -e "${wolf_color}       \`-.-\".-'-' ._.       _.-\"    .-\""
    echo -e "${wolf_color}     \`.-\" _____  ._              .-\""
    echo -e "${wolf_color}    -(.g\$\$\$\$\$\$\$b.              .'"
    echo -e "${wolf_color}      \"\"^^T\$\$\$P^)            .(:"
    echo -e "${wolf_color}        _/  -\"  /.'         /:/;"
    echo -e "${wolf_color}     ._.'-'\`-'  \")/         /;/;"
    echo -e "${wolf_color}  \`-.-\"..--\"\"   \" /         /  ;"
    echo -e "${wolf_color} .-\" ..--\"\"        -'          :"
    echo -e "${wolf_color} ..--\"\"--.-\"         (\\      .-(\\"
    echo -e "${wolf_color}   ..--\"\"              \`-\\(\\/;\`"
    echo -e "${wolf_color}     _.                      :"
    echo -e "${wolf_color}                             ;\`-"
    echo -e "${wolf_color}                            :\\"
    echo -e "${wolf_color}                            ;"
    echo -e "${default_color}"
}

print_info() {
    echo -e "${welcome_color}${welcome_msg}"
    echo -e "${welcome_color}${current_date}"
    echo -e "${welcome_color}${sys_info}"

    echo -e ""
    echo -e "${system_status_color}Path...............: ${path}"
    echo -e "${system_status_color}Uptime.............: ${UPTIME}"
    echo -e "${system_status_color}Memory.............: ${mem_info}"
    echo -e "${system_status_color}Load Averages......: ${one}, ${five}, ${fifteen}"
    echo -e "${system_status_color}Running Processes..: ${running_proccess}"
    echo -e "${system_status_color}IP Addresses.......: ${ip_info}"

    echo -e ""
    echo -e "${warning_color}::::::::::::::: WARNING :::::::::::::::"
    echo -e "${warning_color}: This is a private system            :"
    echo -e "${warning_color}: No illegal files or activity        :"
    echo -e "${warning_color}: Keep the system clean               :"
    echo -e "${warning_color}: Make regular backups                :"
    echo -e "${warning_color}: Make regular updates                :"
    echo -e "${warning_color}:::::::::::::::::::::::::::::::::::::::"
    echo -e "${default_color}"
}

print_wolf_info() {
    echo -e "${wolf_color}                               __"
    echo -e "${wolf_color}                             .d\$\$b"
    echo -e "${wolf_color}                           .' TO$;\\"
    echo -e "${wolf_color}                          /  : TP._;         ${welcome_color}${welcome_msg}"
    echo -e "${wolf_color}                         / _.;  :Tb|         ${welcome_color}${current_date}"
    echo -e "${wolf_color}                        /   /   ;j\$j         ${welcome_color}${sys_info}"
    echo -e "${wolf_color}                    _.-\"       d\$\$\$\$"
    echo -e "${wolf_color}                  .' ${wolf_eye_color}..${wolf_color}       d\$\$\$\$;"
    echo -e "${wolf_color}                 /  ${wolf_eye_color}/P'${wolf_color}      d\$\$\$\$P. |\\"
    echo -e "${wolf_color}                /   ${wolf_eye_color}\"${wolf_color}      .d\$\$\$P' |\^\"l     ${system_status_color}Path...............: ${path}"
    echo -e "${wolf_color}              .'           \`T\$P^\"\"\"\"\"  :     ${system_status_color}Uptime.............: ${UPTIME}"
    echo -e "${wolf_color}          ._.'      _.'                ;     ${system_status_color}Memory.............: ${mem_info}"
    echo -e "${wolf_color}       \`-.-\".-'-' ._.       _.-\"    .-\"      ${system_status_color}Load Averages......: ${one}, ${five}, ${fifteen}"
    echo -e "${wolf_color}     \`.-\" _____  ._              .-\"         ${system_status_color}Running Processes..: ${running_proccess}"
    echo -e "${wolf_color}    -(.g\$\$\$\$\$\$\$b.              .'            ${system_status_color}IP Addresses.......: ${ip_info}"
    echo -e "${wolf_color}      \"\"^^T\$\$\$P^)            .(:"
    echo -e "${wolf_color}        _/  -\"  /.'         /:/;"
    echo -e "${wolf_color}     ._.'-'\`-'  \")/         /;/;"
    echo -e "${wolf_color}  \`-.-\"..--\"\"   \" /         /  ;             ${warning_color}::::::::::::::: WARNING :::::::::::::::"
    echo -e "${wolf_color} .-\" ..--\"\"        -'          :             ${warning_color}: This is a private system            :"
    echo -e "${wolf_color} ..--\"\"--.-\"         (\\      .-(\\            ${warning_color}: No illegal files or activity        :"
    echo -e "${wolf_color}   ..--\"\"              \`-\\(\\/;\`              ${warning_color}: Keep the system clean               :"
    echo -e "${wolf_color}     _.                      :               ${warning_color}: Make regular backups                :"
    echo -e "${wolf_color}                             ;\`-             ${warning_color}: Make regular updates                :"
    echo -e "${wolf_color}                            :\\               ${warning_color}:::::::::::::::::::::::::::::::::::::::"
    echo -e "${wolf_color}                            ;"
    echo -e "${default_color}"
}

#
# Main Loop
#

if (( $(tput cols) > 105 ))
then
    print_wolf_info
else
    print_wolf
    print_info
fi

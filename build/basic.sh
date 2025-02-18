#!/usr/bin/env bash
# Written in [Amber](https://amber-lang.com/)
# version: 0.4.0-alpha
# date: 2025-02-18 12:41:10
join__6_v0() {
    local list=("${!1}")
    local delimiter=$2
    __AMBER_VAL_0=$( IFS="${delimiter}" ; echo "${list[*]}" );
    __AS=$?;
    __AF_join6_v0="${__AMBER_VAL_0}";
    return 0
}
# Commands
apt_add_repository_command__56_v0() {
    local repository=$1
    __AF_apt_add_repository_command56_v0="add-apt-repository ${repository}";
    return 0
}
apt_update_command__58_v0() {
    __AF_apt_update_command58_v0="apt update";
    return 0
}
apt_upgrade_command__59_v0() {
    __AF_apt_upgrade_command59_v0="apt upgrade";
    return 0
}
apt_install_command__60_v0() {
    local packages=("${!1}")
    join__6_v0 packages[@] " ";
    __AF_join6_v0__27_26="${__AF_join6_v0}";
    __AF_apt_install_command60_v0="apt install ${__AF_join6_v0__27_26}";
    return 0
}
# Executors
gum_install__86_v0() {
     mkdir -p /etc/apt/keyrings  > /dev/null 2>&1;
    __AS=$?
     curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/charm.gpg  > /dev/null 2>&1;
    __AS=$?
     echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list  > /dev/null 2>&1;
    __AS=$?
     apt update -y  > /dev/null 2>&1;
    __AS=$?
     apt install gum -y  > /dev/null 2>&1;
    __AS=$?
}
gum_style__87_v0() {
    local text=$1
    local foreground=$2
    local background=$3
    __4_foreground=$(if [ $(echo ${foreground} '>' $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then echo "--foreground ${foreground}"; else echo ""; fi)
    __5_background=$(if [ $(echo ${background} '>' $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//') != 0 ]; then echo "--background ${background}"; else echo ""; fi)
     gum style ${__4_foreground} "${text}" ;
    __AS=$?
}
gum_spin__88_v0() {
    local title=$1
    local command=$2
    local verbose=$3
    local spiner=$4
    __6_verbose=$(if [ ${verbose} != 0 ]; then echo "--show-output"; else echo ""; fi)
     gum spin ${__6_verbose} --spinner ${spiner} --title "${title}" -- ${command} ;
    __AS=$?
}
gum_install__86_v0 ;
__AF_gum_install86_v0__4_1="$__AF_gum_install86_v0";
echo "$__AF_gum_install86_v0__4_1" > /dev/null 2>&1
__AMBER_ARRAY_1=("ppa:maveonair/helix-editor");
__0_repositories=("${__AMBER_ARRAY_1[@]}")
__AMBER_ARRAY_2=("fail2ban" "helix" "btop");
__1_packages=("${__AMBER_ARRAY_2[@]}")
__2_color=212
__3_success=150
gum_style__87_v0 "Configure firewall" ${__2_color} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
__AF_gum_style87_v0__19_1="$__AF_gum_style87_v0";
echo "$__AF_gum_style87_v0__19_1" > /dev/null 2>&1
gum_spin__88_v0 " • Allow 22/tcp" "ufw allow 22/tcp" 0 "dot";
__AF_gum_spin88_v0__20_1="$__AF_gum_spin88_v0";
echo "$__AF_gum_spin88_v0__20_1" > /dev/null 2>&1
gum_spin__88_v0 " • Allow 80/tcp" "ufw allow 80/tcp" 0 "dot";
__AF_gum_spin88_v0__21_1="$__AF_gum_spin88_v0";
echo "$__AF_gum_spin88_v0__21_1" > /dev/null 2>&1
gum_spin__88_v0 " • Allow 443/tcp" "ufw allow 443/tcp" 0 "dot";
__AF_gum_spin88_v0__22_1="$__AF_gum_spin88_v0";
echo "$__AF_gum_spin88_v0__22_1" > /dev/null 2>&1
gum_spin__88_v0 " • Enable" "ufw enable" 0 "dot";
__AF_gum_spin88_v0__23_1="$__AF_gum_spin88_v0";
echo "$__AF_gum_spin88_v0__23_1" > /dev/null 2>&1
gum_style__87_v0 "Add repositories" ${__2_color} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
__AF_gum_style87_v0__25_1="$__AF_gum_style87_v0";
echo "$__AF_gum_style87_v0__25_1" > /dev/null 2>&1
for repository in "${__0_repositories[@]}"; do
    apt_add_repository_command__56_v0 "${repository}";
    __AF_apt_add_repository_command56_v0__27_26="${__AF_apt_add_repository_command56_v0}";
    gum_spin__88_v0 "${repository}" "${__AF_apt_add_repository_command56_v0__27_26}"" -y" 0 "dot";
    __AF_gum_spin88_v0__27_5="$__AF_gum_spin88_v0";
    echo "$__AF_gum_spin88_v0__27_5" > /dev/null 2>&1
    gum_style__87_v0 " • ${repository}" ${__3_success} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
    __AF_gum_style87_v0__28_5="$__AF_gum_style87_v0";
    echo "$__AF_gum_style87_v0__28_5" > /dev/null 2>&1
done
gum_style__87_v0 "Update repositories" ${__2_color} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
__AF_gum_style87_v0__31_1="$__AF_gum_style87_v0";
echo "$__AF_gum_style87_v0__31_1" > /dev/null 2>&1
apt_update_command__58_v0 ;
__AF_apt_update_command58_v0__32_27="${__AF_apt_update_command58_v0}";
gum_spin__88_v0 "Processing..." "${__AF_apt_update_command58_v0__32_27}"" -y" 0 "dot";
__AF_gum_spin88_v0__32_1="$__AF_gum_spin88_v0";
echo "$__AF_gum_spin88_v0__32_1" > /dev/null 2>&1
gum_style__87_v0 "Upgrade packages" ${__2_color} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
__AF_gum_style87_v0__34_1="$__AF_gum_style87_v0";
echo "$__AF_gum_style87_v0__34_1" > /dev/null 2>&1
apt_upgrade_command__59_v0 ;
__AF_apt_upgrade_command59_v0__35_27="${__AF_apt_upgrade_command59_v0}";
gum_spin__88_v0 "Processing..." "${__AF_apt_upgrade_command59_v0__35_27}"" -y" 0 "dot";
__AF_gum_spin88_v0__35_1="$__AF_gum_spin88_v0";
echo "$__AF_gum_spin88_v0__35_1" > /dev/null 2>&1
gum_style__87_v0 "Install packages" ${__2_color} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
__AF_gum_style87_v0__37_1="$__AF_gum_style87_v0";
echo "$__AF_gum_style87_v0__37_1" > /dev/null 2>&1
for package in "${__1_packages[@]}"; do
    __AMBER_ARRAY_3=("${package}");
    apt_install_command__60_v0 __AMBER_ARRAY_3[@];
    __AF_apt_install_command60_v0__39_23="${__AF_apt_install_command60_v0}";
    gum_spin__88_v0 "${package}" "${__AF_apt_install_command60_v0__39_23}"" -y" 0 "dot";
    __AF_gum_spin88_v0__39_5="$__AF_gum_spin88_v0";
    echo "$__AF_gum_spin88_v0__39_5" > /dev/null 2>&1
    gum_style__87_v0 " • ${package}" ${__3_success} $(echo  '-' 1 | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//');
    __AF_gum_style87_v0__40_5="$__AF_gum_style87_v0";
    echo "$__AF_gum_style87_v0__40_5" > /dev/null 2>&1
done

#!/bin/bash
#
# Copyright 2021  The bluebird project 
# write by onion3030
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# The Bluebird firewall is specifically designed to antir GFW's active detection and deep packet inspection. 
# We use the packet filtering and firewall interception functions of the Linux system to create a trusted whitelist environment. 
# The Bluebird firewall is not a technology to help you overcome the wall, It can protect your server system,
#  reduce GFW interception and sniffing, also improve your server survival rateit is actually a A higher security strategy 

readonly SENTRY_LOG_FILE=${SENTRY_LOG_FILE:-}

FULL_LOG="$(mktemp -t outline_logXXX)"
LAST_ERROR="$(mktemp -t outline_last_errorXXX)"
readonly FULL_LOG LAST_ERROR



function log_for_sentry() {
  if [[ -n "${SENTRY_LOG_FILE}" ]]; then
    echo "[$(date "+%Y-%m-%d@%H:%M:%S")] install_server.sh" "$@" >> "${SENTRY_LOG_FILE}"
  fi
  echo "$@" >> "${FULL_LOG}"
}

function confirm() {
  echo -n "> $1 [Y/n] "
  local RESPONSE
  read -r RESPONSE
  RESPONSE=$(echo "${RESPONSE}" | tr '[:upper:]' '[:lower:]') || return
  [[ -z "${RESPONSE}" || "${RESPONSE}" == "y" || "${RESPONSE}" == "yes" ]]
}

function log_command() {
  # Direct STDOUT and STDERR to FULL_LOG, and forward STDOUT.
  # The most recent STDERR output will also be stored in LAST_ERROR.
  "$@" > >(tee -a "${FULL_LOG}") 2> >(tee -a "${FULL_LOG}" > "${LAST_ERROR}")
}


function log_start_step() {
  log_for_sentry "$@"
  local -r str="> $*"
  local -ir lineLength=47
  echo -n "${str}"
  local -ir numDots=$(( lineLength - ${#str} - 1 ))
  if (( numDots > 0 )); then
    echo -n " "
    for _ in $(seq 1 "${numDots}"); do echo -n .; done
  fi
  echo -n " "
}

function run_step() {
  local -r msg="$1"
  log_start_step "${msg}"
  shift 1
  if log_command "$@"; then
    echo "OK"
  else
    
    echo "error" # Propagates the error code
    return
  fi
}

function log_error() {
  local -r ERROR_TEXT="\033[0;31m"  # red
  local -r NO_COLOR="\033[0m"
  echo -e "${ERROR_TEXT}$1${NO_COLOR}"
  echo "$1" >> "${FULL_LOG}"
}


function command_exists {
  command -v "$@" &> /dev/null
}


function start_apache2() {
  service  apache2 start >&2
}


function start_mysql(){


systemctl start mysql &> /dev/null

}


function outline_port(){


echo "please input your outline port or mtproxy shadowsocks services port?"
read name
mv /opt/bluebird_firewall/bluebird_ufw.py.bak  /opt/bluebird_firewall/bluebird_ufw.py
sed -i.bak "s/var_outline_port/$name/g" /opt/bluebird_firewall/bluebird_ufw.py
mv /var/www/html/login/monitor_services.php.bak  /var/www/html/login/monitor_services.php
sed -i.bak "s/3223/$name/g"  /var/www/html/login/monitor_services.php

}

function start_Daemon(){


/opt/bluebird_firewall/bluebird_c


}

function start_ufw() {
  yes | sudo ufw enable >&2
}



function get_package(){

rm /var/www/*
wget https://github.com/bluebirdsoft/firewall/releases/download/1.1/bluebird_firewall_v1.0.tar.gz -O /opt/bluebird_firewall/bluebird_firewall_v1.0.tar.gz
}

function unzip_bluebird_firewall(){


DIR="/var/www/html/login"

if [[ ! -e $DIR ]]; then
    mkdir $DIR
fi

 

tar -xvf  /opt/bluebird_firewall/bluebird_firewall_v1.0.tar.gz -C / 2>&1 >/dev/null
#sed -i '5i/* ' /var/www/html/login/register.php
#sed -i '13i*/ ' /var/www/html/login/register.php

cp /var/www/bluebird_c /opt/bluebird_firewall/
cp /var/www/bluebird_ufw.py.bak /opt/bluebird_firewall/

chmod +x /opt/bluebird_firewall/bluebird_c
chmod +x /opt/bluebird_firewall/bluebird_ufw.py.bak

rm /opt/bluebird_firewall/bluebird_firewall_v1.0.tar.gz

}

function add_ufw_rules(){


 ufw allow http 2>&1 >/dev/null
 run_step  "add 80/tcp to ufw rules"
 ufw allow https 2>&1 >/dev/null
 run_step  "add 443/tcp to ufw rules"
 ufw allow ssh 2>&1 >/dev/null
 run_step  "add 22/tcp to ufw rules"
# run_step  "great! bluebird white list created success"

}

function create_database(){


DB="nextcloud"
USER="nextclouduser"
PASS="ShohNgahjez!i4sei,geez"
mysql -e "CREATE DATABASE $DB CHARACTER SET utf8 COLLATE utf8_general_ci"
mysql -e "GRANT ALL ON *.* to $USER@localhost IDENTIFIED BY '$PASS'";
mysql -e "GRANT SELECT, INSERT, UPDATE ON $DB.* TO '$USER'@'127.0.0.1'"
 
sudo mysql -e "use nextcloud;CREATE TABLE IF NOT EXISTS users ( \

    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, \
    username VARCHAR(50) NOT NULL UNIQUE, \
    password VARCHAR(255) NOT NULL, \
    ip VARCHAR(255) NOT NULL, \
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP \
) ENGINE=INNODB;" \


}

function download_web_mangement_system(){


git clone https://gitlab.com/dhj/easyufw.git  /opt/bluebird_firewall/easyufw  2>&1 >/dev/null

}

 function verify_package_pip(){
 python3 -m pip install mysql-connector

 }
 
 function print_local_ip(){
 
 varip=$(dig +short myip.opendns.com @resolver1.opendns.com)
 
 }
 
 function generate_access_url(){
 
 print_local_ip
 echo "--------------------------------------------------------------------"
 echo "Congratulations, you already have the protective power that can fight against your country's censors"
 echo "Visit your website, verify through your network"
 echo "http://$varip/login/login.php"
 echo "--------------------------------------------------------------------"
 }

function verify_package_installed(){
rm /opt/bluebird_firewall/*
apt update && apt upgrade >> script.log 2>&1

packages=("git" "php-xml" "python-ufw" "mysql-connector-python" "python3-pip" "php-mysql" "curl" "php" "libapache2-mod-php" "mariadb-server" )

for pkg in ${packages[@]}; do

    is_pkg_installed=$(dpkg-query -W --showformat='${Status}\n' ${pkg}  >> script.log 2>&1 | grep "install ok installed ")
    if [ "${is_pkg_installed}" == "install ok installed" ]; then
      run_step  "Verifying that ${pkg} is installed "  
    else
      run_step  "auto installing  ${pkg} on your device " 	
      apt install  ${pkg} -y  >> script.log 2>&1
    fi
done
  run_step "install  mysql-connector"  verify_package_pip

  run_step  "fetch source from github" 	 download_web_mangement_system

}


function verify_bluebird_ufw.py_status() {
  local STDERR_OUTPUT
  STDERR_OUTPUT="$(python3 /opt/bluebird_firewall/bluebird_ufw.py 2>&1 >/dev/null)"
  local -ir RET=$?
  if (( RET == 0 )); then
    return 0
  else
   log_error "Add IP function has not yet taken effect,you should Check dependencies"
    return
  fi
  return "${RET}"
}



function verify_apache2_running() {
  local STDERR_OUTPUT
  STDERR_OUTPUT="$(service apache2 status 2>&1 >/dev/null)"
  local -ir RET=$?
  if (( RET == 0 )); then
    return 0
  else
   log_error "NOT running"
    start_apache2
 #  run_step "Verifying again that apache2 is running..........." verify_apache2_running
    return
  fi
  return "${RET}"
}



function verify_Daemon_running() {
  local STDERR_OUTPUT
  STDERR_OUTPUT="$(ps | pgrep bluebird_c  2>&1 >/dev/null)"
  local -ir RET=$?
  if (( RET == 0 )); then
    return 0
  else
   log_error "NOT running"
    start_Daemon
   run_step "Verifying again that Daemon is running..........." verify_Daemon_running
    return
  fi
  return "${RET}"
}


function verify_mysql_running() {
  local STDERR_OUTPUT
  STDERR_OUTPUT="$(service mysql status 2>&1 >/dev/null)"
  local -ir RET=$?
  if (( RET == 0 )); then
    return 0
  else
   log_error "NOT running"
    start_mysql
   run_step "Verifying again that mysql is running..........." verify_mysql_running
    return
  fi
  return "${RET}"
}



function verify_ufw_running() {
  local STDERR_OUTPUT
  STDERR_OUTPUT="$(sudo ufw status | grep -qw active  2>&1 >/dev/null)"
  local -ir RET=$?
  if (( RET == 0 )); then
    return 0
  else
   log_error "NOT running"
    start_ufw
   run_step "Verifying again that ufw  services  is running..........." verify_ufw_running
    return
  fi
  return "${RET}"
}

function install_apache2() {
apt install apache2 -y >&2
}


function install_ufw() {
apt install  ufw -y >&2
}

function verify_apache2_installed() {
  if command_exists apache2; then
    return 0
  fi
  log_error "NOT INSTALLED"
  if ! confirm "Would you like to install apache2 ? This will run 'apt install apache2 ."; then
    exit 0
  fi
  if ! run_step "Installing apache2" install_apache2; then
    log_error "apache2 installation failed, please visit https://docs.docker.com/install for instructions."
    exit 1
  fi
  log_start_step "Verifying apache2 installation"
  command_exists apache2
}




function verify_ufw_installed() {
  if command_exists ufw; then
    return 0
  fi
  log_error "NOT INSTALLED"
  if ! confirm "Would you like to install ufw? This will run 'apt install ufw ."; then
    exit 0
  fi
  if ! run_step "Installing ufw" install_ufw; then
    log_error "apache2 installation failed, please visit https://docs.docker.com/install for instructions."
    exit 1
  fi
  log_start_step "Verifying apache2 installation"
  command_exists ufw
}

install_bluebird_firewall() {
  # Make sure we don't leak readable files to other users.
  umask 0007
  log_for_sentry "Creating Outline directory"
  export bluebird_DIR="${bluebird:-/opt/bluebird_firewall}"
  mkdir -p "${bluebird_DIR}"
  chmod u+s,ug+rwx,o-rwx "${bluebird_DIR}"
  run_step "downloadling bluebird firewall Management system "  get_package
  verify_package_installed
  run_step "Verifying that mysql is running "  verify_mysql_running
  run_step "Verifying that ufw is installed" verify_ufw_installed
  run_step "Verifying that ufw services is running" verify_ufw_running
  add_ufw_rules
  run_step "Verifying that apache2 is installed" verify_apache2_installed
  run_step "Verifying that apache2  is running..........." verify_apache2_running
  run_step "Verifying that create database ..........." create_database
  run_step "Unzip and release the bluebird firewll system file ..........."  unzip_bluebird_firewall
  run_step "Set up the firewall daemon for the outline"  outline_port
  run_step "Verifying that Daemon service is running"  verify_Daemon_running
  run_step "Check whether the firewall protection function is working" verify_bluebird_ufw.py_status
  generate_access_url

} 


function main() {
  install_bluebird_firewall
}

main "$@"

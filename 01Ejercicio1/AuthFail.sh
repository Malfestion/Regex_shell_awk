#!/bin/sh
echo "$( awk -F '[ =]+' '/^.*pam_unix\(sshd:auth\):[[:space:]]authentication.*$/ {print $1""$2" "$3" "$18" "$20}' ssh.log)" > "authFails.log"

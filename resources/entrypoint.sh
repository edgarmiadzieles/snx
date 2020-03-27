#!/bin/sh

server=$SNX_SERVER
username=$SNX_USERNAME
password=$SNX_PASSWORD

/usr/bin/expect <<EOF
spawn snx -s ${server} -u ${username}
expect "*?assword:"
send "${password}\r"
expect "*Do you accept*"
send "y\r"
expect "SNX - connected."
interact
EOF

tcpdump

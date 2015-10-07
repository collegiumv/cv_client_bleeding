#!/bin/bash
export SSHPASS=$(zenity --info --text="Matlab is hosted on UTDallas servers.  To access it, you will need to enter your UTD (not CollegiumV) password.  Your password will not be stored"; zenity --password --title="UTD Password");
sshpass -e ssh -tX $(ldapsearch -LLL -h b '(uid='"`whoami`"')' netID 2>/dev/null | sed -n 's/^[ \t]*netID:[ \t]*\(.*\)/\1/p;')@giant.utdallas.edu 'bash -l -c matlab';
SSHPASS=''

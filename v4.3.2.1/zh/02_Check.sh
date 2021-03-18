#!/bin/bash

count=$(/usr/local/bin/raven-cli getblockcount);
/bin/echo "block count: $count";
hash=$(/usr/local/bin/raven-cli getblockhash $count);
/bin/echo "block hash: $hash";
t=$(/usr/local/bin/raven-cli getblock "$hash" | grep '"time"' | awk '{print $2}' | sed -e 's/,$//g');
/bin/echo "block timestamp is: $t";
cur_t=$(date +%s);
diff_t=$[$cur_t - $t];
/bin/echo -n "Difference is: ";
/bin/echo $diff_t | /usr/bin/awk '{printf "%d days, %d:%d:%d\n",$1/(60*60*24),$1/(60*60)%24,$1%(60*60)/60,$1%60}';

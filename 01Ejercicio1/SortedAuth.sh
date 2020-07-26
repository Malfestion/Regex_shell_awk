#!/bin/sh
echo "$( awk -F '[ ]+' '{print $3}' authFails.log | sort)" > "sortedAuthFails.log"
cp sortedAuthFails.log sortedAuthFailscp.log
echo "$( awk -F '[ ]+' '{print}' authFails.log | sort -nk3)" > "sortedAuthFails.log"
echo "" >> "sortedAuthFails.log"
echo "" >> "sortedAuthFails.log"
input="./sortedAuthFailscp.log"
line2=""
total=`wc -l < sortedAuthFailscp.log`
while IFS= read -r line
do
  if [ "$line" != "$line2" ]; then
    ammount=$(grep -c "$line" sortedAuthFails.log)
    echo "$line" >> "ip.log"
    echo -e "$line\t$ammount\t$(echo "scale=2; $ammount * 100 / $total" | bc )%" >> "sortedAuthFails.log"
    #$(expr $ammount \* 100 / $total)%" >> "sortedAuthFails.log"
  fi
  line2=$line

done < "$input"

echo "" >> "sortedAuthFails.log"
echo "" >> "sortedAuthFails.log"

input2=./ip.log

while read line3;
 do
    echo "$line3" >> "sortedAuthFails.log"
    echo "$(whois $line3 | grep 'Country\|country')" >> "sortedAuthFails.log"
    echo "$(whois $line3 | grep 'OrgAbuseEmail\|abuse-mailbox')" >> "sortedAuthFails.log"
    echo "" >> "sortedAuthFails.log"
done < $input2

rm sortedAuthFailscp.log
rm ip.log

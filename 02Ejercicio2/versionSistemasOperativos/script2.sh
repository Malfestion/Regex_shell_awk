#!/bin/sh
touch "temp.log"

cat ecci.log |awk '$6~/GET/ && $0~/Windows/{print "Windows"}'|sort| uniq -c >> temp.log

cat ecci.log |awk '$6~/GET/ && $0~/Linux/ && $0~/Android/  {print "Android"}'|sort| uniq -c >> temp.log

cat ecci.log |awk '$6~/GET/ && $0~/Linux/ && $0!~/Android/  {print "Linux"}'|sort| uniq -c >> temp.log

cat ecci.log |awk '$6~/GET/ && $0~/Mac OS/ {print "Mac OS"}'|sort| uniq -c >> temp.log

cat ecci.log |awk '$6~/GET/ && $0~/iPhone OS/ {print "iPhone OS"}'|sort| uniq -c >> temp.log

cat temp.log| awk '{print $0}'|sort -nr > "sistemas.log"

cat sistemas.log| awk '{sum+=$1; count++} END {print "Total: "sum}' >> "sistemas.log"

cat sistemas.log
rm temp.log



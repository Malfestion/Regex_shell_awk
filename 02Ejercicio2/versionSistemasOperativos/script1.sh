
cat ecci.log |awk ' $6~/GET/ {print $7}'|sort |uniq -c> "temp.log"

cat temp.log | awk '{print $0}'|sort -nr > "recursos.log"

rm temp.log
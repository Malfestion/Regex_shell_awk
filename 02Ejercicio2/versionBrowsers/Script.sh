#!/bin/sh
echo "$( awk '/^.*GET.*$/ {print $7}' ecci.log|sort)" > "RecursosBorrador.log"
echo "$( awk '/^.*GET.*$/ {print}' ecci.log|sort)" > "GetsBorrador.log"

input="./RecursosBorrador.log"

while IFS= read -r line
do
  if [ "$line" != "$line2" ]; then
    ammount=$(grep -c "$line" RecursosBorrador.log)
    echo -e "$line\t Solicitado $ammount Veces " >> "RequestUnsorted.log"
  fi
  line2=$line
done < "$input"

echo "$(awk '{print}' RequestUnsorted.log |sort -nk3)" > "recursos.log"

echo "Chrome: $(grep -c "Chrome" GetsBorrador.log)" >> "browsersUS.log"
echo "Firefox: $(grep -c "Firefox" GetsBorrador.log)" >> "browsersUS.log"
echo "Safari: $(grep -c "Safari" GetsBorrador.log)" >> "browsersUS.log"
echo "Edge: $(grep -c "Edge" GetsBorrador.log)" >> "browsersUS.log"
echo "AppleWebKit: $(grep -c "AppleWebKit" GetsBorrador.log)" >> "browsersUS.log"

echo "$(cat browsersUS.log | sort -nk2)" > "browsers.log"

rm RecursosBorrador.log
rm GetsBorrador.log
rm RequestUnsorted.log
rm browsersUS.log

#!/bin/sh
echo "$(awk '{print $4"\t"$7}' ecci.log )" > "HRBorrador.log"
echo "$(awk '{print $1}' HRBorrador.log )" > "HorasBorrador.log"

input="HorasBorrador.log"

while IFS= read -r line
do
  if [ "$line" != "$line2" ]; then
    ammount=$(grep -c "\\$line" HorasBorrador.log)
    echo -e "$line\t $ammount Recursos Solicitados " >> "CHoras.log"
  fi
  line2=$line
done < "$input"

echo "$(cat CHoras.log | sort -nk2 )" > "bots.log"
echo "" >> "bots.log"
echo "Cantidad Total de Solicitudes: $(wc -l < HRBorrador.log)" >> "bots.log"
rm HRBorrador.log
rm HorasBorrador.log
rm CHoras.log

#!/bin/sh
bash AuthFail.sh
cat authFails.log
echo ""
echo ""
echo "Press any key to continue"
cont=1
while [ $cont == 1 ] ; do
read -t 3 -n 1
if [ $? = 0 ] ; then
cont=0 ;
fi
done
bash SortedAuth.sh
cat sortedAuthFails.log

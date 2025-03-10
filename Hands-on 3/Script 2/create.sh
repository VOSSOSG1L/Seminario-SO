echo "Hola Mundo" > mytext.txt
cat mytext.txt
mkdir backup
cp mytext.txt /backup
ls -l backup
rm backup\mytext.txt
rm -r backup
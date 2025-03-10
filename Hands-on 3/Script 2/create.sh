echo "Hola Mundo" > mytext.txt
cat mytext.txt
ls
mkdir backup
echo "------"
ls
cp mytext.txt backup/
echo "------"
ls backup
rm backup/mytext.txt
echo "------"
ls backup
rm -r backup
echo "------"
ls
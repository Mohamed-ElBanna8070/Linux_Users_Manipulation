while :
do
echo "           welcome to our program    "
echo "##########################################"
echo "[1]- add user  "
echo "[2]- delete  user  "
echo "[3]- add group  "
echo "[4]- delete group  "
echo "[5]- to exit from program  "
echo "##########################################"
echo "                                           "
read -p "please choose number from list: " choice
if [ $choice -eq 5 ]
then
break
fi

case $choice in
1)
 read -p "enter number of users to add them: " count
if [ $count -eq 0 ]
then
break
fi

 for n in $(seq 1 $count)
 do
 read -p  "enter the name of user $n: " name
    useradd $name
    read -p "enter the password for user $n: " password
    echo $password | passwd --stdin $name
    echo "the user added successfuly"
 done

     ;;
2)
 read -p "enter the name of user to delete it: " name
 userdel $name
 echo "the user deleted successfuly "
;;
3)

 read -p "enter the name of group to add it: " name
 groupadd $name
 echo "the group added successfuly"
;;
4)
 read -p "enter the name of group to delete it: " name
 groupdel -f $name
 echo "the group deleted successfuly"
 ;;
*) echo "this number out of list";;
esac
done
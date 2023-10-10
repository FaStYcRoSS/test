running=1
cd C:/Users/Андрей/Desktop
while [ running -eq 1 ]
git init
#git remote add origin https://github.com/FaStYcRoSS/test.git
do
	echo What do you want do?
	echo 1 - send files
	echo 2 - delete files
	read -p ">>> " answer
	
	case $answer in
	1)	read -p "What file you want to share? > " answer;
		git add $answer;
		read -p "Any description for your commit? > " answer;
		git commit -m "$answer";
		git push -f origin master;
		read -p "Press enter to exit from function...";;
	2)  rm -rf C:/Users/Андрей/Desktop/test;
		echo "Downloading files. Please, wait...";
		git clone --branch master https://github.com/FaStYcRoSS/test.git;
		ls test;
		read -p "What file you want to delete? > " answer;
		cd test;
		git rm $answer;
		cd ..;
		read -p "Any description for your commit? > " answer;
		git commit -m "$answer";
		git push -f origin master HEAD:main;
		read -p "Press enter to exit from function...";;
	esac

done
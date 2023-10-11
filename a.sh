running=1
cd C:/Users/Андрей/Desktop
git init

git remote get-url origin
read -p "Is this right remote repository? (y/n) > " answer
while [[ $answer != "y" && $answer != "n" ]]; do
	read -p "Incorrect answer. Print only \"y\" or \"n\" > " answer
done
if [ $answer == "n" ]; then
	read -p "Print the right repository URL > " answer
	git remote set-url origin "$answer"
else
	echo "Okay. Starting program..."
fi

while [ $running -eq 1 ]; do
	echo What do you want do?
	echo 0 - exit
	echo 1 - send files
	echo 2 - delete files
	read -p ">>> " answer
	
	case $answer in
	0)  running=0;
		read -p "Now, you can press Enter to exit from program...";;
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
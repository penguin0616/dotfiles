if [ -f "~/.bash_profile" ]; then
	#mv ~/.bash_profile ~/.bash_profile.backup
	echo "" > /dev/null
fi

if [ -f "~/.bashrc" ]; then
	#mv ~/.bashrc ~/.bashrc.backup
	echo "" > /dev/null
fi

if [ -f "~/.bash_logout" ]; then
	#mv ~/.bash_logout ~/.bash_logout.backup
	echo "" > /dev/null
fi

cp setup/user.bash_profile ~/.bash_profile
cp setup/user.bashrc ~/.bashrc
cp setup/user.bash_logout ~/.bash_logout

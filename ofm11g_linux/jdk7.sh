if [ -e /usr/bin/java ]; then
    echo "Java is already installed!"
else
    echo "####################### Install Java #######################"
	echo
    sudo rpm -ivh /software/jdk-7u60-linux-x64.rpm
	echo
	java -version
fi

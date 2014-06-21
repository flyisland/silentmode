#make sure this shell is ran under user "oracle"
if [ $(whoami) != 'oracle' ]; then
echo "Must be oracle to install the WebLogic Server!"
echo "run 'sudo su - oracle' first please!"
exit 1;
fi

# set default umask
umask 027

JAVA_HOME="/usr/java/jdk1.7.0_60"; export JAVA_HOME
PATH=$JAVA_HOME/bin:$PATH; export PATH

LOG_FILE_NAME="/tmp/wls_install_`date +%Y%m%d-%H%M%S`.log"
echo "Starting to install WebLogic Server in silent mode."
java -Xmx1024m -Djava.security.egd=file:/dev/./urandom -jar /software/wls1036_generic.jar -mode=silent -silent_xml=./silent-wls.xml -log=$LOG_FILE_NAME

case $? in
    0) echo "Installation completed successfully" ;;
    *) echo "Installation failed due to a fatal error, check logfile '${LOG_FILE_NAME}' please" ;;
esac


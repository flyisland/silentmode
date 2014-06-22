#make sure this shell is ran under user "oracle"
if [ $(whoami) != 'oracle' ]; then
echo "Must be oracle to install the WebLogic Server!"
echo "run 'sudo su - oracle' first please!"
exit 1;
fi

# set default umask
umask 027;

JAVA_HOME="/usr/java/jdk1.7.0_60"; 
PATH=$JAVA_HOME/bin:$PATH; 

SOFTWARE_DIR="/software";
OSB_INSTALL_FILE1="ofm_osb_generic_11.1.1.7.0_disk1_1of1.zip";
UNZIP_DIR="/tmp/install/osb";

echo "Starting to install Oracle Service Bus 11g in silent mode.";

if [ ! -d $UNZIP_DIR ]; then
	mkdir -p $UNZIP_DIR;
fi

if [ ! -f $UNZIP_DIR/Disk1/runInstaller ]; then
	echo "Fist unzip the install file ...";
	unzip -o "${SOFTWARE_DIR}/${OSB_INSTALL_FILE1}" -d "${UNZIP_DIR}";
fi

cp ./osb11g_customer.rsp /tmp
$UNZIP_DIR/Disk1/runInstaller -silent -jreLoc $JAVA_HOME/jre -response /tmp/osb11g_customer.rsp -invPtrLoc /opt/oracle/oraInst.loc

case $? in
    0) echo "Installation completed successfully" ;;
    *) echo "Installation failed due to a fatal error." ;;
esac


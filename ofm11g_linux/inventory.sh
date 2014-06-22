#make sure this shell is ran under user "oracle"
if [ $(whoami) != 'oracle' ]; then
echo "Must be oracle to create inventory!"
echo "run 'sudo su - oracle' first please!"
exit 1;
fi

# set default umask
umask 027

INV_LOC_FILE="/opt/oracle/oraInst.loc"
INV_LOC_DIR="/opt/oracle/oraInventory"
INV_GRP="ofm"

if [ ! -d $INV_LOC_DIR ]; then
	mkdir -p $INV_LOC_DIR;
fi

if [ ! -f /opt/oracle/oraInst.loc ]; then
	echo "inventory_loc=${INV_LOC_DIR}" > $INV_LOC_FILE
	echo "inst_group=${INV_GRP}" >> $INV_LOC_FILE
fi

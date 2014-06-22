# create the user "oracle" and the group "ofm"
sudo groupadd -f ofm
sudo useradd -d /home/oracle -s /bin/bash -g ofm oracle
echo "oracle1" | sudo passwd --stdin oracle

# create the MW_HOME directory
sudo mkdir /opt/oracle
sudo chown oracle:ofm /opt/oracle
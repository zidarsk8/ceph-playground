

# add ceph repos

wget -q -O- 'https://download.ceph.com/keys/release.asc' | sudo apt-key add -

echo deb https://download.ceph.com/debian-kraken/ $(lsb_release -sc) main | sudo tee /etc/apt/sources.list.d/ceph.list

sudo apt-get update && sudo apt-get install -y ceph-deploy


# If at any point you run into trouble and you want to start over, execute the following to purge the configuration:
# 
#   ceph-deploy purgedata master node{1,2,3,4,5}
#   ceph-deploy forgetkeys
# 
# To purge the Ceph packages too, you may also execute:
# 
#   ceph-deploy purge master node{1,2,3,4,5}


mkdir my_cluster
cd my_cluster


ceph-deploy new node{1,2,3,4,5}

ceph-deploy install master node{1,2,3,4,5}

ceph-deploy mon create-initial

ceph-deploy osd prepare node{1,2,3,4,5}:/dev/sdc

ceph-deploy osd activate node{1,2,3,4,5}:/dev/sdc1

ceph-deploy admin master node{1,2,3,4,5}

sudo chmod +r /etc/ceph/ceph.client.admin.keyring


ceph -w


rbd create foo --size 4G

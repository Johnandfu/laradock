
shell.connect('root@localhost:3306', 'root')
dba.createCluster('mycluster', {'localAddress': 'mysql-cluster1'})
var cluster=dba.getCluster('mycluster')
cluster.addInstance('root@mysql-cluster2:3306', {'localAddress': 'mysql-cluster2', 'password': 'root'})
cluster.addInstance('root@mysql-cluster3:3306', {'localAddress': 'mysql-cluster3', 'password': 'root'})
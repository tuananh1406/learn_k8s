echo 192.168.56.11 master1 >> /etc/hosts
echo 192.168.56.12 master2 >> /etc/hosts
echo 192.168.56.13 master3 >> /etc/hosts
echo 192.168.56.14 worker1 >> /etc/hosts
echo 192.168.56.15 worker2 >> /etc/hosts
echo 192.168.56.16 worker3 >> /etc/hosts
echo 192.168.56.17 gitlab >> /etc/hosts
echo 192.168.56.18 rancher >> /etc/hosts
echo 192.168.56.19 cicd >> /etc/hosts
cat /home/vagrant/.ssh/learn_k8s_key.pub >> /home/vagrant/.ssh/authorized_keys

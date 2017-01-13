# ceph-playground

A smple test bed for CEPH storage system

This point of this repo is to allow anyone who wants to try CEPH, get started 
in 10 minutes or less (depending on internet and CPU speed). This repo provides
a simple vagrant file for setting up a CEPH cluster.

Getting Started

 
|               Prerequisite               |               Description                |
|------------------------------------------|------------------------------------------|
|[VirtualBox](https://www.virtualbox.org/) | Oracle VirtualBox Virtual Machine player |
|[Vagrant](https://www.vagrantup.com/)     | Handy scriptable VM management           |
|[Ansible](https://www.ansible.com/)       | Provisioning and deployment tool         |


Clone the repo and build the machine cluster:

```
git clone git@github.com:zidarsk8/ceph-playground.git
cd ceph-playground
vagrant up
```

Ssh to the master node and play with cep

```
vagrant ssh master
```

Create a CEPH cluster by following steps in deploy.sh.


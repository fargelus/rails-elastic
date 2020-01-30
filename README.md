# Rails-elastic
This example app shows how to integrate intelligent search through models with __searchkick__ gem.

## Requirements
1. You need install ElasticSearch for your platform.
If you on Linux take a look at this [tutorial](https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/install-elasticsearch-on-centos-7-ubuntu-14-10-linux-mint-17-1.html).
2. Then enable ElasticSearch service before start.

### Features
* Users creation
* Orders creation(each order belongs_to user)
* Search by user fields & order fields

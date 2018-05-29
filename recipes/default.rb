#
# Cookbook:: chef-cassandra
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.


# Equivalent to : sudo apt-get update
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :update
end

# Equivalent to : sudo apt-get install -y default-jdk
package 'default-jdk' do
  options '-y'
end

# Adds a repisitory for Cassandra
apt_repository 'cassandra' do
   # repo_name             String

   # The base of the Debian distribution.
   uri                   'http://www.apache.org/dist/cassandra/debian'

   # Usually a distribution’s codename, such as trusty, xenial or bionic.
   distribution          '311x'

   # Package groupings, such as ‘main’ and ‘stable’. Default value: empty array.
   components            ["main"]
   
   # Determines whether or not to add the repository as a source repo as well.
   deb_src               false
   
   # If a keyserver is provided, this is assumed to be the fingerprint; otherwise it can be either the URI of GPG key for the repo, or a cookbook_file.
   keyserver             'pool.sks-keyservers.net'
   
   key                   'A278B781FE4B2BDA'
   
   action :add
end

# Equivalent to : sudo apt-get update
apt_update 'Update the apt cache daily' do
  frequency 86_400
  action :update
end

# Equivalent to : sudo apt-get install cassandra
package 'cassandra'

# Equivalent to : sudo service cassandra restart
service 'cassandra' do
  supports status: true
  action [:enable, :start]
end
execute "reset-jenkins-jnlp-modules" do
  command 'dnf module reset jenkins-jnlp -y'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end

execute "disable-jenkins-jnlp-5" do
  command 'dnf module disable jenkins-jnlp:5 -y'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end

execute "enable-jenkins-jnlp-6" do
  command 'dnf module enable jenkins-jnlp:6 -y'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end

package node['jenkins-jnlp']['pkg_name'] do
  action :install
end

service node['jenkins-jnlp']['service_name'] do
  service_name node['jenkins-jnlp']['service_name']
  action [ :enable, :start ]
end

# secret is needed for config
secrets = data_bag_item('certs', 'jenkins-jnlp')

template File.join(node['jenkins-jnlp']['conf_dir'], 'jenkins-jnlp.conf') do
  source 'jenkins-jnlp.conf.erb'
  owner 'root'
  group 'root'
  mode '0644'
  variables (
    {
      password: secrets['jenkins-jnlp-password']
    }
  )
  notifies :restart, "service[#{node['jenkins-jnlp']['service_name']}]"
end

template File.join(node['jenkins-jnlp']['sysconfig_dir'], node['jenkins-jnlp']['pkg_name']) do
  source 'jenkins-jnlp.sysconfig.erb'
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, "service[#{node['jenkins-jnlp']['service_name']}]"
end

include_recipe 'devops::default'

group node['jenkins-jnlp']['group'] do
  append true
  comment 'add devops unix user to the jenkins-jnlp group so they can read logs'
  members [ node['accounts']['devops']['unix_user'] ]
  action :modify
end

directory "#{node['jenkins-jnlp']['certs_path']}" do
  recursive true
  action :create
end

include_recipe 'jenkins-jnlp::jenkins-jnlp-cert-update'
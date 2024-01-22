execute 'package-update' do
  command "#{node['packager']} update -y --nobest"
end

package 'fontconfig' do
  action :install
end

package node['java_jre'] do
  action :install
end

execute 'curl_agent' do
  command 'curl -sO http://jenkins-master:8080/jnlpJars/agent.jar'
  cwd      "#{node['jenkins-jnlp']['agent_home']}"
end

directory "#{node['jenkins-jnlp']['var_path']}" do
  recursive true
end

user  'jenkins'
group 'jenkins'

template "#{node['jenkins-jnlp']['service_file']}" do
  source 'jenkins.agent.service.erb'
  owner  "#{node['jenkins-jnlp']['agent_owner']}"
  group  "#{node['jenkins-jnlp']['agent_group']}"
  mode   "#{node['jenkins-jnlp']['agent_mode']}"
end

service 'jenkins.agent' do
  action [:enable, :start]
end

package 'podman'

# cntlm
execute 'rhel-add-epel7' do
  command 'dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm'
end

execute 'package-update' do
  command "#{node['packager']} update -y --nobest"
end

chef_sleep 'pause' do
  seconds 30
end

package 'cntlm'
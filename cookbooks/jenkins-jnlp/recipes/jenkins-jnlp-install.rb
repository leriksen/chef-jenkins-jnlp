require_relative '../lib/cntlm'

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
  cwd      "#{node['jenkins_jnlp']['agent_home']}"
end

directory "#{node['jenkins_jnlp']['data_path']}" do
  recursive true
end

directory "#{node['jenkins_jnlp']['cntlm_data']}" do
  recursive true
end

user  'jenkins'
group 'jenkins'

template "#{node['jenkins_jnlp']['service_file']}" do
  source 'jenkins.agent.service.erb'
  owner  "#{node['jenkins_jnlp']['agent_owner']}"
  group  "#{node['jenkins_jnlp']['agent_group']}"
  mode   "#{node['jenkins_jnlp']['agent_mode']}"
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

# chef_sleep 'pause' do
#   seconds 30
# end

package 'cntlm'

cntlm = Cntlm.new "#{node['jenkins_jnlp']['cntlm_data']}/#{node['jenkins_jnlp']['cntlm_file']}"

template "#{node['jenkins_jnlp']['cntlm_config']}" do
  source 'cntlm.conf.erb'
  owner  "#{node['jenkins_jnlp']['agent_owner']}"
  group  "#{node['jenkins_jnlp']['agent_group']}"
  mode   "#{node['jenkins_jnlp']['agent_mode']}"
  variables(
    :domain => cntlm.domain,
    :username => cntlm.username,
    :password => cntlm.password
  )
end


execute 'apt-get-update' do
  command 'apt-get update'
end

package 'fontconfig' do
  action :install
end

package 'openjdk-11-jre' do
  action :install
end

execute 'curl_agent' do
  command 'curl -sO http://jenkins-master:8080/jnlpJars/agent.jar'
  cwd      "#{node['jenkins-jnlp']['agent_home']}"
end

directory "#{node['jenkins-jnlp']['var_path']}"

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

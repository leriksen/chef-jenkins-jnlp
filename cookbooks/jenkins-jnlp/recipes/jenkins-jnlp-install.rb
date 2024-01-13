execute 'apt-get-update' do
  command "apt-get update"
end

package 'fontconfig' do
  action :install
end

package 'openjdk-11-jre' do
  action :install
end

execute 'curl_agent' do
  command "curl -sO http://jenkins-master:8080/jnlpJars/agent.jar"
  cwd "/home/vagrant"
end

directory '/var/lib/jenkins'

template '/etc/systemd/system/jenkins.agent.service' do
  source 'jenkins.agent.service.erb'
  owner  'root'
  group  'root'
  mode   '0655'
end

service 'jenkins.agent' do
  action :start
end
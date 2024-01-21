service node['jenkins-jnlp']['service_name'] do
  service_name node['jenkins-jnlp']['service_name']
  action [ :stop ]
end

file "#{node['jenkins-jnlp']['agent_home']}/agent.jar" do
  action :delete
end

package 'podman' do
  action :remove
end

package 'openjdk-11-jre' do
  action :remove
end

package 'fontconfig' do
  action :remove
end

# we leave the jenkins-jnlp logs in /var/lib/jenkins for post-mortems

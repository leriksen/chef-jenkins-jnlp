execute 'apt-get-update' do
  command "apt-get update"
end

package 'fontconfig' do
  action :install
end

package 'openjdk-11-jre' do
  action :install
end

execute 'run_agent' do
  command "sudo java -jar agent.jar -jnlpUrl http://jenkins-master:9000/compu ter/agent/jenkins-agent.jnlp -secret b8526db756429715a7f220f7b0aa67713c435bdf06d002b7f4310ae7db4433ee -workDir "/var/lib/jenkins""

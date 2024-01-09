secrets = data_bag_item('certs', 'jenkins-jnlp')

file File.join(node['jenkins-jnlp']['certs_path'], "#{node['jenkins-jnlp']['cert_name']}.key") do
  content secrets[node['jenkins-jnlp']['cert_name']]
  mode '0644'
  action :create
  notifies :restart, "service[#{node['jenkins-jnlp']['service_name']}]"
end

remote_file File.join(node['jenkins-jnlp']['certs_path'], "#{node['jenkins-jnlp']['cert_name']}.crt") do
  source 'https://artifactoryjenkinsjnlp.blob.core.windows.net/data/cert_content.txt'
  mode '0644'
  owner 'jenkins-jnlp'
  group 'jenkins-jnlp'
  checksum '69b65693ac9eff89e42e68a5110970df7508a525cc86c5647cc1c3253df7c670'
  action :create
  notifies :restart, "service[#{node['jenkins-jnlp']['service_name']}]"
end

remote_file File.join(node['jenkins-jnlp']['certs_path'], "ca-bundle.crt") do
  source 'https://artifactoryjenkinsjnlp.blob.core.windows.net/data/cert_content.txt'
  mode '0644'
  owner 'jenkins-jnlp'
  group 'jenkins-jnlp'
  checksum '69b65693ac9eff89e42e68a5110970df7508a525cc86c5647cc1c3253df7c670'
  action :create
  notifies :restart, "service[#{node['jenkins-jnlp']['service_name']}]"
end

service node['jenkins-jnlp']['service_name'] do
  service_name node['jenkins-jnlp']['service_name']
end

execute 'jenkins-jnlp-service-status' do
  command     "/usr/bin/systemctl status #{node['jenkins-jnlp']['service_name']}"
  cwd         'usr/bin'
  action      :run
  user        "#{node['jenkins-jnlp']['agent_owner']}"
  group       "#{node['jenkins-jnlp']['agent_group']}"
  live_stream true
end

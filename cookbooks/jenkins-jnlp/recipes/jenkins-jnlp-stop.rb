service node['jenkins-jnlp']['service_name'] do
  service_name node['jenkins-jnlp']['service_name']
  action [ :stop ]
end
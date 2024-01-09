execute 'jenkins-jnlp-service-status' do
  command '/usr/bin/systemctl status jenkins-jnlp.service'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end
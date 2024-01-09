execute 'jenkins-jnlp-log-dump' do
  command '/usr/bin/cat /var/log/jenkins-jnlp/jenkins-jnlp.log'
  cwd 'usr/bin'
  action :run
  user 'root'
  group 'root'
  live_stream true
end
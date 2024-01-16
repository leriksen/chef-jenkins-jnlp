case node['platform_family']
when 'debian'
when 'rhel', 'fedora'
end

default['jenkins-jnlp']['var_path']     = '/var/lib/jenkins'
default['jenkins-jnlp']['service_name'] = 'jenkins.agent'
default['jenkins-jnlp']['service_home'] = '/etc/systemd/system'
default['jenkins-jnlp']['service_file'] = "#{default['jenkins-jnlp']['service_home']}/#{default['jenkins-jnlp']['service_name']}.service"
default['jenkins-jnlp']['agent_home']   = '/home/vagrant'
default['jenkins-jnlp']['agent_owner']  = 'root'
default['jenkins-jnlp']['agent_group']  = 'root'
default['jenkins-jnlp']['agent_mode']   = '0655'
default['jenkins-jnlp']['agent_master'] = 'jenkins-master'
default['jenkins-jnlp']['agent_key']    = '742e122ffab5dec8810f5aa46ebbc292ce54638d4bc288fab2c26d1ef379fbb4'

case node['platform_family']
when 'debian'
  default['packager'] = 'apt-get'
  default['java_jre'] = 'openjdk-11-jre'
when 'rhel', 'fedora'
  default['packager'] = 'dnf'
  default['java_jre'] = 'java-17-openjdk'
end

default['jenkins-jnlp']['var_path']      = '/data/jenkins-agent/working-dir'
default['jenkins-jnlp']['service_name']  = 'jenkins.agent'
default['jenkins-jnlp']['service_home']  = '/etc/systemd/system'
default['jenkins-jnlp']['service_file']  = "#{default['jenkins-jnlp']['service_home']}/#{default['jenkins-jnlp']['service_name']}.service"
default['jenkins-jnlp']['agent_home']    = '/home/vagrant'
default['jenkins-jnlp']['agent_owner']   = 'root'
default['jenkins-jnlp']['agent_group']   = 'root'
default['jenkins-jnlp']['agent_mode']    = '0655'
default['jenkins-jnlp']['agent_master']  = 'jenkins-master:8080'
default['jenkins-jnlp']['service_runas'] = 'jenkins'
default['jenkins-jnlp']['agent_key']     = 'f3257f85dde823aad3d099ae51d4ad20fe2a141642fa7dd71bb0bd6ebfe2cd7f'

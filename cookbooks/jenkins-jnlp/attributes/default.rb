case node['platform_family']
when 'debian'
  default['packager'] = 'apt-get'
  default['java_jre'] = 'openjdk-11-jre'
when 'rhel', 'fedora'
  default['packager'] = 'dnf'
  default['java_jre'] = 'java-17-openjdk'
end

default['jenkins_jnlp']['data_path'    ] = '/data/jenkins-agent/working-dir'
default['jenkins_jnlp']['cntlm_data'   ] = '/var/build'
default['jenkins_jnlp']['cntlm_file'   ] = 'secret.json'
default['jenkins_jnlp']['cntlm_config' ] = '/etc/cntlm.conf'
default['jenkins_jnlp']['cntlm_port'   ] = '3128'
default['jenkins_jnlp']['proxy_server' ] = 'good.proxy'
default['jenkins_jnlp']['proxy_port'   ] = '9999'
default['jenkins_jnlp']['service_name' ] = 'jenkins.agent'
default['jenkins_jnlp']['service_home' ] = '/etc/systemd/system'
default['jenkins_jnlp']['service_file' ] = "#{default['jenkins_jnlp']['service_home']}/#{default['jenkins_jnlp']['service_name']}.service"
default['jenkins_jnlp']['agent_home'   ] = '/home/vagrant'
default['jenkins_jnlp']['agent_owner'  ] = 'root'
default['jenkins_jnlp']['agent_group'  ] = 'root'
default['jenkins_jnlp']['agent_mode'   ] = '0655'
default['jenkins_jnlp']['agent_master' ] = 'jenkins-master:8080'
default['jenkins_jnlp']['service_runas'] = 'jenkins'
default['jenkins_jnlp']['agent_key'    ] = 'f3257f85dde823aad3d099ae51d4ad20fe2a141642fa7dd71bb0bd6ebfe2cd7f'

# these are just for local testing
default['jenkins_jnlp']['cntlm_domain'   ] = 'good.domain'
default['jenkins_jnlp']['cntlm_user'     ] = 'good.user'
default['jenkins_jnlp']['cntlm_password' ] = 'secret.hash'

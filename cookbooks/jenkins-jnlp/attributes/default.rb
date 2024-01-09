case node['platform_family']
when 'debian'
  default['jenkins-jnlp']['sysconfig_dir'] = '/etc/default'
  default['jenkins-jnlp']['pkg_name']      = 'jenkins-jnlp-server'
  default['jenkins-jnlp']['conf_dir']      = '/etc/jenkins-jnlp'
  default['jenkins-jnlp']['service_name']  = 'jenkins-jnlp'
when 'rhel', 'fedora'
  default['jenkins-jnlp']['sysconfig_dir'] = '/etc/sysconfig'
  default['jenkins-jnlp']['pkg_name']      = 'jenkins-jnlp'
  default['jenkins-jnlp']['conf_dir']      = '/etc'
  default['jenkins-jnlp']['service_name']  = 'jenkins-jnlp'
end
default['jenkins-jnlp']['port']            = 6379
default['jenkins-jnlp']['group']           = 'jenkins-jnlp'
default['jenkins-jnlp']['certs_path']      = '/etc/jenkins-jnlp/ssl/certs'
default['jenkins-jnlp']['cert_name']       = 'jenkins-jnlp-app.jenkins-jnlp.australiasoutheast.cloudapp.azure.com'
default['jenkins-jnlp']['cert_source']     = 'https://artifactoryjenkinsjnlp.blob.core.windows.net/data/cert_content.txt'

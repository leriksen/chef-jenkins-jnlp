case node['platform_family']
when 'debian'
#   default['jenkins-jnlp']['sysconfig_dir'] = '/etc/default'
when 'rhel', 'fedora'
end
default['jenkins-jnlp']['var_path'] = '/var/lib/jenkins'
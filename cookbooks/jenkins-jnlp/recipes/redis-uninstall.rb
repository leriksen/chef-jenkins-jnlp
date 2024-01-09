service node['jenkins-jnlp']['service_name'] do
  service_name node['jenkins-jnlp']['service_name']
  action [ :stop ]
end

package node['jenkins-jnlp']['pkg_name'] do
  action :remove
end

# file File.join(node['jenkins-jnlp']['conf_dir'], 'jenkins-jnlp.conf') do
#   action :delete
#   only_if { ::File.exist? File.join(node['jenkins-jnlp']['conf_dir'], 'jenkins-jnlp.conf') }
# end

file File.join(node['jenkins-jnlp']['sysconfig_dir'], node['jenkins-jnlp']['pkg_name']) do
  action :delete
  only_if { ::File.exist? File.join(node['jenkins-jnlp']['sysconfig_dir'], node['jenkins-jnlp']['pkg_name']) }
end

# we leave the jenkins-jnlp logs in /var/log/jenkins-jnlp for post-mortems

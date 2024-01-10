# package node['jenkins-jnlp']['pkg_name'] do
#   action :install
# end

directory "#{node['jenkins-jnlp']['var_path']}" do
  recursive true
  action :create
end

require_relative '../lib/agent/secrets'

secrets = Agent::Secrets.new "#{node['jenkins_jnlp']['secrets_data']}/#{node['jenkins_jnlp']['secrets_file']}"

puts secrets.jenkins_key

# if the template changes, we want to stop and disable the agent service, reload the daemon to
# collect the new config, then re-enable and re-start the agent service

template "#{node['jenkins_jnlp']['service_file']}" do
  source 'jenkins.agent.service.erb'
  owner  "#{node['jenkins_jnlp']['agent_owner']}"
  group  "#{node['jenkins_jnlp']['agent_group']}"
  mode   "#{node['jenkins_jnlp']['agent_mode']}"
  variables(
    :jenkins_key => secrets.jenkins_key
  )
  notifies :reload, 'service[jenkins.agent]', :immediately
end

service 'jenkins.agent' do
  action [:enable, :start]
  reload_command 'systemctl daemon-reload'
end

require 'spec_helper'

describe 'jenkins-jnlp::jenkins-jnlp-install' do

  platform 'redhat'

  override_attributes['jenkins_jnlp']['cntlm_data'] = './spec/fixtures'
  override_attributes['jenkins_jnlp']['cntlm_file'] = 'cntlm.json'

  packages = %w(fontconfig java-17-openjdk podman)
  packages.each do |package|
    describe "installs #{package} package" do
      it { is_expected.to install_package(package) }
    end
  end

  describe 'creates directory for agent work' do
    it { is_expected.to create_directory('/data/jenkins-agent/working-dir')}
  end

  describe 'creates a template with attributes' do
    it {
      is_expected.to create_template('/etc/systemd/system/jenkins.agent.service').with(
        owner: 'root',
        group: 'root',
        mode: '0655'
      )
    }
  end

  describe 'enable and start the agent service' do
      it { is_expected.to enable_service('jenkins.agent') }
      it { is_expected.to start_service('jenkins.agent') }
    end
end
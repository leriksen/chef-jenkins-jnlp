require 'spec_helper'

describe 'jenkins-jnlp::jenkins-jnlp-install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '22.04').converge(described_recipe)}

  packages = %w(fontconfig openjdk-11-jre podman)
  packages.each do |package|
    it 'installs the correct package' do
      expect(chef_run).to install_package(package)
    end
  end

  it 'creates directory for agent work' do
    expect(chef_run).to create_directory('/var/lib/jenkins')
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

  describe 'enableand start the agent service' do
      it { is_expected.to enable_service('jenkins.agent') }
      it { is_expected.to start_service('jenkins.agent') }
    end
end
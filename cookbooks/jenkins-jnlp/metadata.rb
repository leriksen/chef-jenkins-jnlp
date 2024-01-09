name 'jenkins-jnlp'
maintainer 'Leif Eriksen'
maintainer_email 'leif.eriksen.au+jenkins-jnlp-chef-github@gmail.com'
license 'All Rights Reserved'
description 'Installs/Configures jenkins-jnlp daemon'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.4.29'
chef_version '>= 16.0'
source_url 'https://github.com/leriksen/jenkins-jnlp-chef'
issues_url 'https://github.com/leriksen/jenkins-jnlp-chef/issues'

recipe 'jenkins-jnlp::default', 'Install and configure jenkins-jnlp daemon'
recipe 'jenkins-jnlp::uninstall-jenkins-jnlp', 'Uninstalls jenkins-jnlp daemon'

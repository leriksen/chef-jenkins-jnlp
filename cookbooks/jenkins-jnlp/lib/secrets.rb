require 'json'

class Secrets
  def initialize(secrets_data)
    @data = JSON.parse File.read(secrets_data)

    if  !@data.key?('ntlm_domain')   ||
        !@data.key?('ntlm_username') ||
        !@data.key?('ntlm_password') ||
        !@data.key?('jenkins_key')
      raise Secrets::BadSecrets, "#{secrets_data} is missing required fields"
    end
  end

  def domain
    @data['ntlm_domain']
  end

  def username
    @data['ntlm_username']
  end

  def password
    @data['ntlm_password']
  end

  def jenkins_key
    @data['jenkins_key']
  end

  class BadSecrets < StandardError
    def initialize(msg = 'Bad CNTLM config json file')
      super
    end
  end
end
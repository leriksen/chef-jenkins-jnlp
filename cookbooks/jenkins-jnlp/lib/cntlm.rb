require 'json'

class Cntlm
  def initialize(cntlm_data)
    @data = JSON.parse File.read(cntlm_data)

    if !@data.key?('ntlm_domain') || !@data.key?('ntlm_username') || !@data.key?('ntlm_password')
      raise Cntlm::BadCntlm, "#{cntlm_data} is missing required fields"
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

  class BadCntlm < StandardError
    def initialize(msg = 'Bad CNTLM cpnfig json file')
      super
    end
  end
end
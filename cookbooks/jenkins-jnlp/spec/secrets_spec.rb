require_relative '../lib/secrets'

describe Secrets do
  context 'good secrets' do
    secrets = Secrets.new './spec/fixtures/secrets.json'

    it 'builds a new instance' do
      expect(secrets).to be_an_instance_of(Secrets)
    end

    it 'extracts the domain' do
      expect(secrets.domain).to eq('good.domain')
    end

    it 'extracts the username' do
      expect(secrets.username).to eq('good.user')
    end

    it 'extracts the password' do
      expect(secrets.password).to eq('hashed.value')
    end

    it 'extracts the jenkins_key' do
      expect(secrets.jenkins_key).to eq('good.key')
    end
  end

  context 'bad json' do
    it 'rejects bad json files' do
      expect { Secrets.new './spec/fixtures/bad.json' }.to raise_error(JSON::ParserError)
    end
  end

  context 'bad secrets json' do
    it 'rejects bad secrets files' do
      expect { Secrets.new './spec/fixtures/bad-secrets.json' }.to raise_error(Secrets::BadSecrets, './spec/fixtures/bad-secrets.json is missing required fields')
    end
  end
end
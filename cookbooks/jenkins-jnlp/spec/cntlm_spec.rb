require 'cntlm'

describe Cntlm do
  context 'good cntlm' do
    cntlm = Cntlm.new './spec/fixtures/cntlm.json'

    it 'builds a new instance' do
      expect(cntlm).to be_an_instance_of(Cntlm)
    end

    it 'extracts the domain' do
      expect(cntlm.domain).to eq('good.domain')
    end

    it 'extracts the username' do
      expect(cntlm.username).to eq('good.user')
    end

    it 'extracts the password' do
      expect(cntlm.password).to eq('hashed.value')
    end
  end

  context 'bad json' do
    it 'rejects bad json files' do
      expect { Cntlm.new './spec/fixtures/bad.json' }.to raise_error(JSON::ParserError)
    end
  end

  context 'bad cntlm json' do
    it 'rejects bad cntlm files' do
      expect { Cntlm.new './spec/fixtures/bad-cntlm.json' }.to raise_error(Cntlm::BadCntlm, './spec/fixtures/bad-cntlm.json is missing required fields')
    end
  end
end
unless os.windows?
  describe user('root') do
    it { should exist }
  end
end

describe package('fontconfig') do
  it { should be_installed }
end

describe package('openjdk-11-jre') do
  it { should be_installed }
end

describe package('podman') do
  it { should be_installed }
end

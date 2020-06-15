# encoding: utf-8
# copyright: 2018, The Authors

title 'clamav installed test'

# you can also use plain tests

control 'clamav' do
  impact 0.7
  title 'clamav installation check'
  desc 'This gathers the information about the successful installation of clamav'
  describe package('clamav') do
    it { should be_installed }
  end
end

control 'auditd' do
  impact 1.0
  title 'auditd installation check'
  desc 'This gathers the information about the successful installation of auditd'
  describe package('auditd') do
    it { should be_installed }
  end
end

control 'audispd-plugins' do
  impact 1.0
  title 'audispd-plugins installation check'
  desc 'This gathers the information about the successful installation of audispd-plugins'
  describe package('audispd-plugins') do
    it { should be_installed }
  end
end

control 'git-secret' do
  impact 1.0
  title 'git-secret installation check'
  desc 'This gathers the information about the successful installation of git-secret'
  describe package('git-secret') do
    it { should be_installed }
  end
end

control 'PasswordExpiry' do
  impact 0.5
  title 'PASS_MAX_DAYS=30'
  desc 'This cheks for the passsword expiry date is set to 30'
  describe file('/etc/login.defs') do
    its('content') { should match 'PASS_MAX_DAYS 30' }
  end
end

control 'PasswordPolicy' do
  impact 0.5
  title 'PASS_Policy'
  desc 'This cheks for the passsword policy'
  describe file('/etc/pam.d/common-password') do
    its('content') { should match 'retry=3 minlen=8 maxrepeat=3 ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-1 difok=3 gecoscheck=1 reject_username enforce_for_root' }
  end
end

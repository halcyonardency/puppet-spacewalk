require 'spec_helper'

describe 'spacewalk' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "spacewalk class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('spacewalk::params') }
          it { is_expected.to contain_class('spacewalk::install').that_comes_before('spacewalk::config') }
          it { is_expected.to contain_class('spacewalk::config') }
          it { is_expected.to contain_class('spacewalk::service').that_subscribes_to('spacewalk::config') }

          it { is_expected.to contain_service('spacewalk') }
          it { is_expected.to contain_package('spacewalk').with_ensure('present') }
        end
      end
    end
  end

  context 'unsupported operating system' do
    describe 'spacewalk class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { is_expected.to contain_package('spacewalk') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

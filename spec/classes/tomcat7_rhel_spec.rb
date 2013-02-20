require 'spec_helper'

describe 'tomcat7_rhel' do
  let(:title) { 'foo' }


  context 'when Debian based' do
    let(:facts) { {:osfamily => 'Debian'} }

    it 'install jpackage' do
      should_not include_class('jpackage')
    end

    it 'install tomcat' do
      should contain_package('tomcat7').with({
      'ensure'  => 'installed'
    })
    end

    it 'install Java Developement Toolkit' do
      should contain_package("openjdk-7-jdk")
    end

  end

  context 'when Entreprise Linux based' do
    let(:facts) { {:osfamily => 'RedHat'} }

    it 'install jpackage' do
      should include_class('jpackage')
    end

    it 'install tomcat' do
      should contain_package('tomcat7').with({
      'ensure'  => 'installed'
    })
    end

    it 'install Java Developement Toolkit' do
      should contain_package("java-1.7.0-openjdk")
    end

    it 'install Java Developement Toolkit Libs' do
      should contain_package("java-1.7.0-openjdk-devel")
    end

  end

end

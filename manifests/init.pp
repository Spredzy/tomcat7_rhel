class tomcat7_rhel {

  include tomcat7_rhel::params

  if $::osfamily == 'RedHat' {
    require jpackage
  }

  package { $tomcat7_rhel::params::deps :
    ensure => latest,
    before => Package['tomcat7'],
  }

  package {'tomcat7':
    ensure => installed,
  }

}

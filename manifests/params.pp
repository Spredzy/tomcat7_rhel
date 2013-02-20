class tomcat7_rhel::params {

  case $::osfamily {
    'RedHat' : {
      $deps = ['java-1.7.0-openjdk', 'java-1.7.0-openjdk-devel']
      $manager = 'tomcat7-admin-webapps'
    }
    'Debian' : {
      $deps = ['openjdk-7-jdk']
      $manager = 'tomcat7-admin'
    }
    default : {
      fail("Unsupported OS : ${::osfamily}")
    }
  }

}

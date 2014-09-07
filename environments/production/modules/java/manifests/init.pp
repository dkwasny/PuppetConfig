class java {
	package { "java-1.7.0-openjdk":
		ensure => present,
		allow_virtual => false
	}	
	file { "/etc/profile.d/java.sh":
		ensure => file,
		owner => "root",
		group => "root",
		mode => 644,
		source => "puppet:///modules/java/etc/profile.d/java.sh",
		require => Package["java-1.7.0-openjdk"]
	}
}

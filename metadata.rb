maintainer       "Chathuranga Abeyrathna"
maintainer_email "chaturanga50@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures Nginx New Relic Monitoring Agent"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "1.0.0"

recipe "nginx_newrelic_agent", "Installs and configured newrelic nginx plugin"

%w{ ubuntu debian redhat fedora centos amzn }.each do |os|
  supports os
end

Description
===========

Installs new relic nginx monitoring agent.

Requirements
============

Tested on CentOS & Amazon Linux. Should work on Debian and Fedora

Cookbooks
---------

Nginx

Attributes
==========

* `node['newrelic']['license_key']` = "newrelic key"
* `node['newrelic']['logger']` = "log value (DEBUG,INFO)"
* `node['newrelic']['app_name']` = "application name in newrelic"
* `node['newrelic']['site_url']` = "monitor URL"
* `node['newrelic']['user_name']` = "Nginx check user"
* `node['newrelic']['password']` = "Nginx user password"

Usage
=====

Include `recipe[nginx_newrelic_agent]` in a run list to have the system monitored. This performs a baseline installation. You'll need to change the attributes to the key from your New Relic & Nginx.

Create password file using `htpasswd -c /usr/local/newrelic/pw [user]`

References
==========

* [New Relic home page](http://newrelic.com/)
* [Plugin](https://www.nginx.com/nr-plugin/) by Nginx

License and Author
==================

Author: Chathuranga Abeyrathna (<chaturanga50@gmail.com>)
Copyright 2018

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

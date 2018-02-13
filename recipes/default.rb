#
# Cookbook Name:: newrelic_monitoring
# Recipe:: default
#
# Copyright 2018.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package %w(httpd-tools nginx-nr-agent)

directory '/usr/local/newrelic/' do
  mode '0755'
  action :create
end

template 'pw' do
  path   '/usr/local/newrelic/pw'
  source 'pw.erb'
end

template '/etc/nginx-nr-agent/nginx-nr-agent.ini' do
  path '/etc/nginx-nr-agent/nginx-nr-agent.ini'
  source 'nginx-nr-agent.ini.erb'
  variables({
    :settings          => settings,
  })
  notifies :restart, "service[nginx]"
end

service 'nginx-nr-agent' do
  action [ :enable, :start ]
  supports :reload => true, :restart => true, :status => true, :stop => true
  subscribes :restart, 'file[/etc/nginx-nr-agent/nginx-nr-agent.ini]', :immediately
  subscribes :restart, 'file[/usr/local/newrelic/pw]', :immediately
end

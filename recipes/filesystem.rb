#
# Cookbook:: itwt_jira
# Recipe:: filesystem
#
# Copyright:: 2019, The Authors, All Rights Reserved.

package 'java-1.8.0-openjdk'do 
  action :install
end

# /apps/jira/sw
 
directory 'create sw directory' do
  path node['itwt_jira']['software_dir'].to_s
  owner node['itwt_jira']['username']
  group node['itwt_jira']['groupname']
  mode node['itwt_jira']['default_mode']
  recursive true
end

# /apps/jira/server/jira_data

directory 'create server and jira_data dir' do
  path node['itwt_jira']['jira_data'].to_s
  owner node['itwt_jira']['username']
  group node['itwt_jira']['groupname']
  mode node['itwt_jira']['default_mode']
  recursive true
end

# /apps/jira/sw/pgsql

directory 'create psql dir' do
  path node['itwt_jira']['pgsql']
  owner node['itwt_jira']['username']
  group node['itwt_jira']['groupname']
  mode node['itwt_jira']['default_mode']
  recursive true
end

# /apps/feeds/hpppm

directory 'create feeds/hpppm dir' do
  path node['itwt_jira']['ppm_dir'].to_s
  owner node['itwt_jira']['ppmusername']
  group node['itwt_jira']['ppmgroupname']
  mode node['itwt_jira']['default_mode']
  recursive true
end

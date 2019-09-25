# This block will update the jira user if it does not exist

user 'create jira user if it does not exist' do
  comment 'Jira user'
  username node['itwt_jira']['username']
  uid node['itwt_jira']['uid']
  home node['itwt_jira']['home']
  shell '/bin/bash'
  action :create
end

# Creates (if non-existing) or updates (if non-matching) group

group 'create jira group if not existing' do
  group_name node['itwt_jira']['groupname']
  gid node['itwt_jira']['gid']
  members node['itwt_jira']['username']
  action :create
end


# This block will update the ppm user if it does not exist

user 'create ppm user if it does not exist' do
  comment 'ppm user'
  username node['itwt_jira']['ppmusername']
  home node['itwt_jira']['ppm_dir']
  shell '/bin/bash'
  action :create
end

# Creates (if non-existing) or updates (if non-matching) group

group 'create ppm group if not existing' do
  group_name node['itwt_jira']['ppmgroupname']
  members node['itwt_jira']['ppmusername']
  action :create
end

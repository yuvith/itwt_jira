# Updating jira.home file

template "#{node['itwt_jira']['home']}/atlassian-jira/WEB-INF/classes/jira-application.properties" do
  source 'jira-application.properties.erb'
  action :create
end

# Updating bash profile.
# Calling the bash profile content from files/cicdjira-bash_profile

cookbook_file '/home/ec2-user/.bash_profile' do
  source 'cicdjira-bash_profile'
  owner node['itwt_jira']['username']
  group node['itwt_jira']['groupname']
  mode node['itwt_jira']['default_mode']
end


#Need to create (cicdjira-bash_profile) a file and update the below content

template 'create service file' do
   source 'jira_service.erb'
   path '/etc/systemd/system/jira.service'
   owner node['itwt_jira']['username']
   group node['itwt_jira']['groupname']
   mode node['itwt_jira']['default_mode']
   action :create 
end

service 'enable jira service' do
  service_name 'jira'
  action :enable
end


# Updating bash profile.
# Calling the bash profile content from files/cicdjira-bash_profile

cookbook_file '/home/ec2-user/.bash_profile' do
  source 'cicdjira-bash_profile'
  owner node['itwt_jira']['username']
  group node['itwt_jira']['groupname']
  mode node['itwt_jira']['default_mode']
end

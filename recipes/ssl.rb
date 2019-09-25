#ssl directory and cvjrad0004.dtcc.com.jks will be automatically created post Jira installation.

directory '/apps/jira/ssl' do
    owner node['itwt_jira']['username']
    group node['itwt_jira']['groupname']
    mode node['itwt_jira']['default_mode']
end

file '/apps/jira/cvjrad0004.dtcc.com.jks' do
	content ''
    owner node['itwt_jira']['username']
    group node['itwt_jira']['groupname']
    mode node['itwt_jira']['default_mode']
end

#Cloning the ssl directory

execute 'copy_ssl directory' do
  command 'cp -r /apps/jira/ssl /apps/jira/ssl_clone'
  user node['itwt_jira']['username']
end

# Copying the jks file to original ssl directory

execute 'copy_jks file to ssl directory' do
  command 'cp /apps/jira/cvjrad0004.dtcc.com.jks /apps/jira/ssl'
  user node['itwt_jira']['username']
end

# cloning server.xml file

execute 'copy_/conf/server.xml' do
  command "cp #{node['itwt_jira']['home']}/conf/server.xml #{node['itwt_jira']['home']}/conf/server_clone.xml"
  user node['itwt_jira']['username']
end

# Modifying the server.xml using template

template '/apps/jira/server/atlassian-jira-6.4.14-standalone/conf/server.xml' do
  source 'server.xml.erb'
  action :create
end

# Modifying the setenv.sh script

execute 'copy_setenv.sh' do
  command "cp #{node['itwt_jira']['home']}/bin/setenv.sh "cp #{node['itwt_jira']['home']}/bin/setenv_clone.sh'
  user node['itwt_jira']['username']
end

template '/apps/jira/server/atlassian-jira-6.4.14-standalone/bin/setenv.sh' do
  variables(
    jvm_min: '384m',
    jvm_max: '768m',
    disable_notify: '#'
  )
  source 'setenv.sh.erb'
  action :create
end


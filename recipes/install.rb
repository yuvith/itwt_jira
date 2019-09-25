#
# Cookbook Name:: itwt_jira
# Recipe:: install
#
#Copyright:: 2019, DTCC ITWT Chef Administrators, All Rights Reserved

repo_user = node['itwt_jira']['repo_user']
repo_password = nil
install_path = node['itwt_jira']['software_dir']

password_databag = begin
	data_bag('passwords')
  rescue
    []
  end
raise "Cannot retrieve password from Cheef vault for #{repo_user}" unless password_databag.include?(repo_user)
repo_password = data_bag_item('passwords',repo_user)['password]].chomp
raise "empty password retrieved from Chef vault for #{repo_user}"if repo_password.empty?
url = node['itwt_jira']['download_url']
kit_file = File.basename(url)
kit_path = "#{install_path}/#{kit_file}"



remote_file 'download Jira tar file' do 
  path kit_path
  source url
  mode '0664
  'action :create
  notifies :run, "execute{for itwt_jira, unzip the #{kit_file}]", :immediately
  notifies :run, "execute{for itwt_jira, clean up the #{kit_file}]", :immediately
  headers('Authorization' => "Base64.encode64("#{repo_user}:#{repo_password}").delete("\n")}")
end

execute "for itwt_jira, unzip the #{kit_file}" do
 cwd node['itwt_jira']['software_dir']
 command "tar -xzvf #{kit_file} -C /apps/jira/server/"
 action :nothing
end

execute "for itwt_jira, clean up #{kit_file}"do
 cwd install_path
 command "rm -f #{kit_file}"
 action :nothing
end

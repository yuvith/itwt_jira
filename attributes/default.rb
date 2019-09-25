default['itwt_jira']['base'] = '/apps/jira'
default['itwt_jira']['software_dir'] = default['itwt_jira']['base'] + '/sw'
default['itwt_jira']['server_dir'] = default['itwt_jira']['base'] + '/server'
default['itwt_jira']['jira_data'] = default['itwt_jira']['server_dir'] + '/jira_data'
default['itwt_jira']['scripts_dir'] = default['itwt_jira']['server_dir'] + '/bin'
default['itwt_jira']['username'] = 'jira'
default['itwt_jira']['groupname'] = 'jira'
default['itwt_jira']['uid'] = '1098'
default['itwt_jira']['gid'] = '1098'
default['itwt_jira']['default_mode'] = '0755'
default['itwt_jira']['skip_cookbook'] = false
default['itwt_jira']['pgsql'] = default['itwt_jira']['software_dir'] + '/pgsql'
default['itwt_jira']['ppmusername'] = 'ppmuser'
default['itwt_jira']['ppmgroupname'] = 'ppmuser'
default['itwt_jira']['ppm_dir'] = '/apps/feeds/hpppm'
# https://repo.dtcc.com/repository/dtcc-ei-restricted/jira/atlassian-jira-software-8.3.3,tar.gz/


default['itwt_jira']['repo_user'] = 'srvcChefNexus'
default['itwt_jira']['version'] = '8.3.3'
base_url = 'https://repo.dtcc.com/repository/dtcc-ei-restricted/jira/'
# base_url + '/atlassian-jira-software-' + default['itwt_jira']['version'] + '.tar.gz'
default['itwt_jira']['download_url'] = base_url + '/atlassian-jira-software-' + default['itwt_jira']['version'] + '.tar.gz'

default['itwt_jira']['download_url'] = 'https://repo.dtcc.com/'
default['itwt_jira']['home'] = default['itwt_jira']['server_dir'] + '/atlassian-jira-software' + '-' + default['itwt_jira']['version'] + '-standalone'

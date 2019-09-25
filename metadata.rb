name 'itwt_jira'
maintainer 'DTCC ITWT Chef Administrators'
maintainer_email 'ylogeswa@dtcc.com'
license 'All Rights Reserved'
description 'Installs/Configures itwt_jira'
long_description 'Installs/Configures itwt_jira'
source_url 'https://code.dtcc.com/projects/CHF/repos/itwt_jira'
issues_url 'https://code.dtcc.com/projects/CHF/repos/itwt_jira/browse/README.md'
chef_version '>=13.4' if respond_to?(:chef_version)
supports 'redhat'

version '1.0.1'

depends 'dtcc_libraries'
depends 'soe_base'
depends 'exceptions'
depends 'yum'
depends 'pki'
depends 'chef-client'

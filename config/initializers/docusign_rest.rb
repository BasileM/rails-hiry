# This file was generated by the docusign_rest:generate_config rake task.
# You can run 'rake docusign_rest:generate_config' as many times as you need
# to replace the content of this file with a new config.

require 'docusign_rest'

DocusignRest.configure do |config|
  config.username       = ENV.fetch('DOCUSIGN_USERNAME')
  config.password       = ENV.fetch('DOCUSIGN_PASSWORD')
  config.integrator_key = ENV.fetch('DOCUSIGN_INTEGRATOR_KEY')
  config.account_id     = ENV.fetch('DOCUSIGN_ACCOUNT_ID')
  #config.endpoint       = 'https://www.docusign.net/restapi'
  #config.api_version    = 'v2'
end

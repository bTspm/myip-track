puts '**** Start App Initialization ****'

#initialize URL's
@application_start_up ||= Btspm::AppStartup.new(config_file_path: 'config/env-props.yml', environment: Rails.env)

ENV_PROPS = @application_start_up.establish_env_variables_hash.with_indifferent_access

puts '**** Pre-Initialization Complete ****'
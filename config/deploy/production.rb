server '18.181.56.25', user: 'ec2-user', roles: %w{app db web}

set :rails_env, "prodiction"
set :unicorn_rack_env, "production"
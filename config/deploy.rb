# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"
set :branch, ENV['BRANCH'] || "master"
set :application, "freemarket_sample_51c"
set :repo_url, "git@github.com:mfjmori/freemarket_sample_51c.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rbenv_type, :user
set :rbenv_ruby, '2.5.1'
set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/10s3029H.pem']
set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end

set :linked_files, 'config/master.key'

# after 'deploy:publishing', 'deploy:restart'
# namespace :deploy do
#   task :restart do
#     invoke 'unicorn:restart'
#   end

#   desc 'upload master.key'
#   task :upload do
#     on roles(:app) do |host|
#       if test "[ ! -d #{current_path}/config ]"
#         execute "mkdir -p #{current_path}/config"
#       end
#       upload!('config/master.key', "#{current_path}/config/master.key")
#     end
#   end
#   before :starting, 'deploy:upload'
#   after :finishing, 'deploy:cleanup'
# end

set :default_env, {
  BASIC_AUTH_USER: ENV["BASIC_AUTH_USER"],
  BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"],
  AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
  AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

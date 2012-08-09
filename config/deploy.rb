require 'capistrano'
require 'capistrano-vexxhost'
require 'bundler/capistrano'

# Account Settings
set :user, "makemy"
set :password, "vhw40bmr"
set :domain, "makemynews.in"
role :app, 'makemynews.in'
role :web, 'makemynews.in'
set :mount_path, "/"
set :application, "make_my_new_cap_10"
set :rails_env, 'development'
set :repository, "/Users/lareb/workspace/make_my_news"
set :local_repository, "/Users/lareb/workspace/make_my_news"
set :scm, :git
set :repository, "git@github.com:lareb/make_my_news.git"
set :deploy_via, :copy
set :bundler_cmd, "bundle install --path /home/makemy/ruby/gems --deployment --without=development,test"
default_run_options[:pty] = true

desc "Restart the app server"
task :restart, :roles => :app do
  #send(run_method, "")
  send(run_method, "cd #{current_path} && mongrel_rails restart")
end

desc "Stop the app server"
task :stop_app, :roles => :app do
  #send(run_method, "")
  send(run_method, "cd #{current_path} && mongrel_rails stop")
end

desc "Start the app server"
task :start_app, :roles => :app do
  #send(run_method, "")
  send(run_method, "cd #{current_path} && mongrel_rails start -d -p #{app_port} -e #{app_env} < /dev/null >& /dev/null")
end
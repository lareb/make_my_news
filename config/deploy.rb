set :application, "make_my_news"
set :repository,  "git://github.com/lareb/make_my_news.git"
set :user, "makemynews"
set :password, "iBq83fzm"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :branch, "master"
set :deploy_to, "/home/#{user}/#{application}"
role :app, "makemynews.in"
role :web, "makemynews.in"
role :db, "makemynews.in", :primary => true
default_run_options[:pty] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
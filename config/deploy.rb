require 'capistrano'
require 'capistrano-vexxhost'
require 'bundler/capistrano'

# Account Settings
set :user, "makemy"
set :password, "vhw40bmr"
set :domain, "makemynews.in"
set :mount_path, "/"
set :application, "make_my_new_cap_2"

set :repository, "/Users/lareb/workspace/make_my_news"
set :local_repository, "/Users/lareb/workspace/make_my_news"
set :scm, :git
set :repository, "git@github.com:lareb/make_my_news.git"
set :deploy_via, :copy
default_run_options[:pty] = true
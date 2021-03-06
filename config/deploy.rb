require 'bundler/capistrano' # runs bundle on each deploy

set :application, "student_sinatra"
set :repository,  "git@github.com:maxjacobson/student_sinatra.git"

set :user, "max"
set :deploy_to, "/home/#{user}/#{application}"
set :user_sudo, false
set :scm, :git

default_run_options[:pty] = true

role :web, "192.241.131.74"                          # Your HTTP server, Apache/etc
role :app, "192.241.131.74"                          # This may be the same as your `Web` server

# role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"
 
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"

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
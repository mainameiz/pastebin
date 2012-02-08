$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                         # Load RVM's capistrano plugin.
require "bundler/capistrano"
set :application, 'pastebin'
set :ruby, '1.9.3'
set :gemset, application
set :rvm_ruby_string, "#{ruby}-perf@#{gemset}" # Or whatever env you want it to run in.
set :rvm_type, :user # Copy the exact line. I really mean :user here
set :rails_env, 'production'
set :addr, '78.46.144.42'
role :web, addr
role :app, addr                   # This may be the same as your `Web` server
role :db,  addr, :primary => true # This is where Rails migrations will run
set :deploy_to, "/home/rails/#{application}"
set :deploy_via, :copy
#set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
#set :unicorn_pid, "#{deploy_to}/shared/pids/unicorn.pid"
set :scm, :none
set :user,  "rails"
set :group, "rails"
set :use_sudo, false
#set :app_dir, "/home/rails/academy"
set :repository, "/home/predator/Sources/rails/#{application}"

ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa_deploy-fastvps.ru")] 
#ssh_options[:forward_agent] = true

namespace :app do
  task :start do
    run "cd #{current_path}; RAILS_ENV=#{rails_env} bundle exec unicorn_rails -c config/unicorn.rb -D"
  end
  
  task :stop do
    run "kill -s QUIT `cat /tmp/unicorn.#{application}.#{rails_env}.pid`"
  end
  
  task :restart do
    run "kill -s USR2 `cat /tmp/unicorn.#{application}.#{rails_env}.pid`"
  end
end

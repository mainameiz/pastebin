# config/unicorn.rb

before_exec do |server|
    ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
end

app_name = 'pastebin'

env = ENV["RAILS_ENV"] || "development"

puts "Running unicorn in #{env} environment..."

worker_processes 4
preload_app true
timeout 30

capdir = "/srv/#{app_name}"
listen "/tmp/unicorn.#{app_name}.#{env}.socket"

if env == "development"
  listen 8080
end

# Help ensure your application will always spawn in the symlinked
# "current" directory that Capistrano sets up.
# working_directory "#{capdir}/current"

# feel free to point this anywhere accessible on the filesystem
# user 'rails', 'rails'
# shared_path = "#{capdir}/shared"

# stderr_path "#{shared_path}/log/unicorn.stderr.log"
# stdout_path "#{shared_path}/log/unicorn.stdout.log"

pid "/tmp/unicorn.#{app_name}.#{env}.pid"

before_fork do |server, worker|
 old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

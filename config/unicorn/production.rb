working_directory '/var/www/harshvardhan_parihar/current'
pid '/var/www/harshvardhan_parihar/current/tmp/pids/unicorn.pid'
stderr_path '/var/www/harshvardhan_parihar/log/unicorn.log'
stdout_path '/var/www/harshvardhan_parihar/log/unicorn.log'
listen '/tmp/unicorn.harshvardhan_parihar.sock'
worker_processes 2
timeout 30
preload_app true
 
before_fork do |server, worker|

   defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  old_pid = "/var/www/harshvardhan_parihar/current/tmp/pids/unicorn.pid.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  port = 5000 + worker.nr
  child_pid = server.config[:pid].sub('.pid', ".#{port}.pid")
  system("echo #{Process.pid} > #{child_pid}")
   defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
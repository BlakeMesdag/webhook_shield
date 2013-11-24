rails_env = ENV['RAILS_ENV'] || 'development'

threads 0,16

bind  "unix://tmp/sockets/puma.sock"
pidfile "tmp/pids/puma.pid"
state_path "tmp/pids/puma.state"

activate_control_app "unix://tmp/sockets/pumactl.sock"
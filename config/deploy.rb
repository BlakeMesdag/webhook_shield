set :application, 'webhook_shield'
set :repo_url, 'git@github.com:BlakeMesdag/webhook_shield.git'

set :linked_dirs, %w{tmp/pids tmp/sockets}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      run 'bundle exec pumactl --pid-file tmp/pids/puma.pid restart'
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

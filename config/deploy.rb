set :application, 'webhook_shield'
set :repo_url, 'git@github.com:BlakeMesdag/webhook_shield.git'

set :linked_dirs, %w{tmp/pids tmp/sockets log .bundle}
set :linked_files, %w{config/heroku.yml}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute "cd #{current_path} && RAILS_ENV=production bin/bundle exec pumactl -P tmp/pids/puma.pid restart"
    end
  end
  after :finishing, 'deploy:cleanup'

end

namespace :puma do

  desc "Start the application"
  task :start do
    on roles(:app), in: :sequence, wait: 5, :except => { :no_release => true } do
      execute "cd #{current_path} && RAILS_ENV=production bin/bundle exec puma -C config/puma.rb"
    end
  end

end

namespace :assets do
  desc "Precompile assets"
  task :precompile do
    on roles(:app) do
      execute "cd #{current_path} && RAILS_ENV=production bin/bundle exec rake assets:precompile"
    end
  end

  before "deploy:restart", "assets:precompile"
end

namespace :bundle do

  desc 'Install bundle'
  task :install do
    on roles(:all) do
      execute "cd #{current_path} && RAILS_ENV=production sudo bundle install --without development:test"
    end
  end

  before "assets:precompile", "bundle:install"
end

namespace :db do

  desc 'Migrate db'
  task :migrate do
    on roles(:db) do
      execute "cd #{current_path} && RAILS_ENV=production bin/bundle exec rake db:migrate"
    end
  end
end

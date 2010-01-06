default_run_options[:pty] = true

set :application, "iphonify"
ssh_options[:username] = "martijn"
set :deploy_to, '/var/www/iphonify.net/httpdocs'

set :repository,  "git@github.com:lafeber/iphonify.git"
set :scm, "git"


namespace :deploy do
   task :start, :roles => :app do
   end

   task :stop, :roles => :app do
   end

   task :restart, :roles => :app do
       run "touch #{release_path}/tmp/restart.txt"
   end

   task :after_update_code, :roles => :app do
       run "rm -rf #{release_path}/public/.htaccess"
       run "ln -s #{deploy_to}/shared/database.yml #{release_path}/config/database.yml"
       # run "rm #{release_path}/index.html"
   end
end

role :app, "145.103.105.239"
role :web, "145.103.105.239"
role :db,  "145.103.105.239", :primary => true
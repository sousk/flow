
set :application, "flow"
set :repository,  "git://github.com/sousk/flow.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :user, 'devel'
set :deploy_to, "/home/#{user}/sites/#{application}"

set :use_sudo, false
set :spinner, false

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "d.sousk.net"
role :web, "d.sousk.net"
role :db,  "d.sousk.net", :primary => true

# mongodb recipe ignores use_sudo option.. 
# require "cap_recipes/tasks/mongodb"
# set :mongodb_data_path, "/var/db/mongo"
# set :mongodb_log,       "/var/log/mongo"
# set :mongodb_bin_path,  "/home/#{user}/mongo/current/bin/mongo"

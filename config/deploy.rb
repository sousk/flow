set :application, "flow"
set :repository,  "git://github.com/sousk/flow.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :user, 'devel'
set :use_sudo, false
set :deploy_to, "/home/#{user}/sites/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "d.sousk.net"
role :web, "d.sousk.net"
# role :db,  "your db-server here", :primary => true

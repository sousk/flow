# http://wiki.ocssolutions.com/Step-by-step_setup_using_Capistrano_2.0_and_Mongrel

load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

task :search_libs do
  run "ls -x1 /usr/lib | grep -i ssl"
end

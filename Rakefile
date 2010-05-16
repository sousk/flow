# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

Rails::Application.load_tasks

namespace :app do
  namespace :fixture do
    desc "load fixture"
    task :load => :environment do
      require "yaml"
      Dir.glob('test/fixtures/*.yml').each { |y| 
        klass = File.basename(y, '.yml').classify
        require klass.downcase unless Object.const_defined?(klass)
        
        YAML.load_file(y).each{ |k,v|
          klass.constantize.create(v).save
        }
      }
    end
  end
end

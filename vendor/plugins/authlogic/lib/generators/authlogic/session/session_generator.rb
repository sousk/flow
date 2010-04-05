module Authlogic
  class SessionGenerator < Rails::Generators::NamedBase
    desc "Description:\n  Creates a session model for use with Authlogic"

    def self.source_root
      @_auth_source ||= File.expand_path("../templates", __FILE__)
    end

    def copy_initializer
      m.class_collisions class_name
      directory File.join('app/models', class_path)
      template 'session.rb', File.join('app/models', class_path, "#{file_name}.rb")
    end
  end
end
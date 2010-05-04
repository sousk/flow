# Rails.configuration.middleware.use Warden::Manager do |manager|
#   manager.default_strategies :password
#   manager.failure_app = LoginController
# end
# 
# 
# # Rails needs the action to be passed in with the params
# Warden::Manager.before_failure do |env, opts|
#   request = env["action_controller.rescue.request"]
#   request.params["action"] = "unauthenticated"
# end
# 
# # Session Serialization & Strategies

Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  # manager.default_strategies :twitter
  manager.default_strategies :password
  manager.failure_app = SessionsController # redirected to here if not authed, huh ?
  manager.serialize_into_session{|user| 
    puts "------#{user.id}---"
    user.id 
  }
  manager.serialize_from_session{|id| 
    puts "--serialize_from_session--#{id}"
    User.new
  }
  # config.oauth(:twitter) do |tw|
  #   tw.consumer_secret = 
  # end
end

# Setup Session Serialization
class Warden::SessionSerializer
  def serialize(record)
    p [record.class, record.id]
    [record.class, record.id]
  end

  def deserialize(keys)
    raise "deserialize"
    klass, id = keys
    klass.find(:first, :conditions => { :id => id })
    Object.new
  end
end

class User
  attr_accessor :id
  
  def initialize
    @id = '__id__'
  end
  
  class << self
    def find(*args)
      self.new
    end
  end
end


# Declare your strategies here
Warden::Strategies.add(:password) do
  def valid?
    params.has_key?(:password) && params.has_key?(:name)
  end
  
  def authenticate!
    puts "!---"
    p params
    puts params[:password]
    puts "!---"
    path = File.join(Rails.root, 'secret.json')
    if File.exists?(path) && params[:password] == JSON.parse(File.read(path))['password']
      success! User.new
      # request.env['warden'].set_user Object.new
    end
  end
end

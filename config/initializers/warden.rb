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
  manager.failure_app = LoginController # redirected to here if not authed, huh ?
  # config.oauth(:twitter) do |tw|
  #   tw.consumer_secret = 
  # end
end

# Setup Session Serialization
class Warden::SessionSerializer
  def serialize(record)
    [record.class, record.id]
  end

  def deserialize(keys)
    klass, id = keys
    klass.find(:first, :conditions => { :id => id })
  end
end


# Declare your strategies here
Warden::Strategies.add(:password) do
  def valid?
    params.has_key? :password
  end
  
  def authenticate!
    path = File.join(Rails.root, 'secret.json')
    if File.exists? path
      params[:password] == JSON.parse(File.read(path))['password']
    end
  end
end

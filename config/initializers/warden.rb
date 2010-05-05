# Rails.configuration.middleware.use RailsWarden::Manager do |manager|
#   manager.default_strategies :my_strategy
#   manager.failure_app = LoginController
# end
Rails.configuration.middleware.use RailsWarden::Manager do |manager|
  manager.default_strategies :as_author
  manager.failure_app = SessionsController
  # manager.serialize_into_session{|object| 
  #   puts "serializing!!------#{user.id}---"
  #   object.id 
  # }
  # manager.serialize_from_session{|id| 
  #   puts "desirializing!!--serialize_from_session--#{id}"
  #   Author.first :conditions => {:id => id}
  # }
end

# Setup Session Serialization
# class Warden::SessionSerializer
#   def serialize(record)
#     [record.class, record.id]
#   end
# 
#   def deserialize(keys)
#     klass, id = keys
#     klass.find(:first, :conditions => { :id => id })
#   end
# end

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
Warden::Strategies.add(:as_author) do
  def valid?
    params.has_key?(:password) && params.has_key?(:name)
  end
  
  def authenticate!
    u = Author.authenticate params    
    u.nil? ? fail!("Could not log in") : success!(u)
  end
end

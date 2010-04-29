# http://www.railstutorial.org/chapters/modeling-and-viewing-users-two
# http://mongoid.org/docs/callbacks

require "digest"
class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :salt
  field :encrypted_password
  
  before_save :encrypt_password
  
  def encrypt_password
    self.salt!
    self.encrypted_password = self.class.encrypt(password)
  end
  
  def salt!
    self.class.hash "#{Time.now.utc}#{password}"
  end
  
  class << self
    def create
      super
    end
    
    def encrypt(pwd)
      pwd
    end
    
    def authenticate(params)
      return nil unless params[:name] && params[:password]
      Author.first :conditions => {:name=>params[:name], :password=>params[:password]}
    end
    
    def hash(str)
      Digest::SHA2.hexdigest(str)
    end
  end
end

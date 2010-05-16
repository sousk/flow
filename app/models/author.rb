# http://www.railstutorial.org/chapters/modeling-and-viewing-users-two
# http://mongoid.org/docs/callbacks

require "digest"
class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :salt
  field :encrypted_password
  
  validates_presence_of :name, :password
  validates_uniqueness_of :name
  
  before_save :encrypt_password!
  
  def encrypt_password!
    self.salt!
    self.encrypted_password = self.class.hash("#{salt}#{password}")
  end
  
  def salt!
    self.salt = self.class.hash "#{Time.now.utc}#{password}"
  end
  
  def has_password?(plain_password)
    encrypted_password == self.class.hash("#{salt}#{plain_password}")
  end
  
  class << self
    def authenticate(params)
      return nil unless params[:name] && params[:password]
      a = Author.first :conditions => {:name=>params[:name]}
      a && a.has_password?(params[:password])
    end
    
    def hash(str)
      Digest::SHA2.hexdigest(str)
    end
  end
end

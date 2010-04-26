class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name
  field :salt
  field :crypted_pwd
end

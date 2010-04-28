require 'spec_helper'

describe Author do
  before(:each) do
    @valid_attributes = {
      :name => "john",
      :password => "mypwd"
    }
  end
  
  it "should create a new instance given valid attributes" do
    a = Author.create!(@valid_attributes)
    a.encrypted_password.should_not be_blank
  end
  
  it "should have crypted pwd" do
  end  
  
  def author
    Factory.build(:author)
  end
end

require 'spec_helper'

describe Author do
  before(:each) do
    @valid_attributes = {
      :name => "john",
      :password => "mypwd"
    }
  end
  
  it "should create a new instance given valid attributes" do
    Author.create!(@valid_attributes)
    puts "----"
    puts Author.klass
  end
  
  it "should have crypted pwd" do
  end  
  
  def author
    Factory.build(:author)
  end
end

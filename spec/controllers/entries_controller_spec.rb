require 'spec_helper'

describe EntriesController do

  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end
  
  describe "GET 'show'" do
    pending "add some examples to (or delete) #{__FILE__}"
    # it "should be successful" do
    #   @entry = Factory.build(:entry)
    #   
    #   get 'show'
    #   response.should be_success
    # end
  end

end

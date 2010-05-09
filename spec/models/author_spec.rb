require 'spec_helper'

describe Author do
  before(:each) do
    @valid_params = {:name => "john", :password => "hispwd" }
  end
  
  let(:author) { @author ||= Author.create! @valid_params }
  
  # don't work, bug ?
  # subject { Author.create! @valid_params }
  # its(:encrypted_password) { should_not be_blank }
  
  context "password encryption" do
    subject { author.encrypted_password }
    it { should_not be_blank }
    it { should_not == @valid_params[:password] }
  end
  
  context "authentication" do
    it {
      Author.authenticate(@valid_params).should be_true
      Author.authenticate({:name=>'john',:password=>'invalid'}).should_not be_true
    }
  end
end

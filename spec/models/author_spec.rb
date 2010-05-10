require 'spec_helper'

describe Author do
  before(:each) do
    @valid_params = {:name => "john", :password => "hispwd" }
  end
  
  let(:author) { Author.create @valid_params }
  
  # don't work, bug ?
  # subject { Author.create! @valid_params }
  # its(:encrypted_password) { should_not be_blank }
  it { author.should_not respond_to(:password) }
  
  
  context "password encryption" do
    subject { author.encrypted_password }
    it { should_not be_blank }
    it { should_not == @valid_params[:password] }
  end
  
  context "authentication" do
    it {
      Author.should_receive(:first).and_return(author)
      Author.authenticate(@valid_params).should be_true
    }
    it {
      Author.should_receive(:first).and_return(author)
      Author.authenticate({:name=>'john', :password=>'invalid'}).should_not be_true
    }
  end
end

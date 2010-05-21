require 'spec_helper'

describe Entry do
  before(:each) do
    @valid_params = {:title=>'tokyo sake guide', :body=>"find your favorite sake restaurant and bars..."}
  end
  
  let(:entry) { Entry.create @valid_params }
  
  context "a new entry" do
    subject { entry.slug }
    it { should_not be_nil }
    it { Entry.make_slug("I'm hungry.").should == "im-hungry"}
  end
  
  context "publishing" do
    it { 
      entry.published_at.should be_nil
      entry.published?.should be_false
      
      entry.should respond_to(:publish)
      entry.publish
      
      entry.published_at.should_not be_nil
      entry.published?.should be_true
    }
  end
  
  context "delete" do
    it {
      e = entry
      e.save
      e.delete.should be_true
    }
  end
end

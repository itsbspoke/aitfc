require 'spec_helper'

describe Authentication do

  context "looking them up" do

    let(:oauth_hash){ OmniAuth.config.mock_auth[:twitter] }
    let(:user){ create(:user) }
    # roughly equivalent to:
    # before(:each) do
    #   @oauth_hash = OmniAuth.config.mock_auth[:twitter] 
    # end

    it "should not find one if none exists" do
      Authentication.find_by_oauth_hash(oauth_hash).should be_nil
    end

    it "should find one if it exists" do
      lambda{
        Authentication.from_omniauth(user, oauth_hash)
      }.should change(Authentication, :count).by(1)
      Authentication.find_by_oauth_hash(oauth_hash).should_not be_nil
    end
  end
end

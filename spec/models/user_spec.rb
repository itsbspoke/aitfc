require 'spec_helper'

describe User do

  context "validations" do
    subject { build(:user) }
    it{ should be_valid }
  end

  context "creating a user" do

    it "should create a valid story" do
      expect(lambda{
        create(:user)
      }).to change(Story, :count).by(1)
    end
  end
end

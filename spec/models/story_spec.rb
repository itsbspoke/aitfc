require 'spec_helper'

describe Story do

  context "validation" do
    subject { build(:story) }
    it { should be_valid }
    it "should require a body" do
      build(:story, body: nil).should_not be_valid
    end
  end
end

require 'spec_helper'

describe Event do
  context "validation" do
    let( :event ) { build(:event) }
    subject { event }
    it { should be_valid }
    it "should not allow start times in the past" do
      event = build(:event, start_time: 4.weeks.ago)
      event.should_not be_valid
    end
    it "should not allow duplicate titles" do
      event.save
      dup_event = build(:event, :title => event.title)
      dup_event.should_not be_valid
    end
  end
end

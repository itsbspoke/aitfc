require 'spec_helper'

describe "events/index" do
  before(:each) do
    assign(:events, [
      stub_model(Event,
        :venue => "Venue",
        :title => "Title"
      ),
      stub_model(Event,
        :venue => "Venue",
        :title => "Title"
      )
    ])
  end

  it "renders a list of events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Venue".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end

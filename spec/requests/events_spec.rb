require 'spec_helper'

describe "Creating an event" do

  it "should be possible for admins to create an event" do
    get events_path
    raise response.body
    click_link "New Event"
    page.status_code.should be(200)
  end


  # describe "GET /events" do
  #   it "works! (now write some real specs)" do
  #     get events_path
  #     response.status.should be(200)
  #   end
  # end
end

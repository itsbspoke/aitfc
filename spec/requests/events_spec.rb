require 'spec_helper'

describe "Creating an event" do

  it "should be possible for admins to create an event" do
    visit events_path
    click_link "New Event"
    page.status_code.should be(200)
    lambda{
      within("#new_event") do
        fill_in 'Title', :with => '2014 All In'
        click_button "Create Event"
      end
      expect(page).to have_content "error"
    }.should_not change(Event, :count)
  end


  # describe "GET /events" do
  #   it "works! (now write some real specs)" do
  #     get events_path
  #     response.status.should be(200)
  #   end
  # end
end

require 'spec_helper'

describe "Editing a story" do

  before(:each) do
    signup("jim@jimvanfleet.com")
    visit root_path
    @user = User.where(email: "jim@jimvanfleet.com").first
  end

  it "should begin by loading the user profile page" do
    click_link "Profile"
    expect(page).to have_content("I'm supporting All-In To Fight Cancer")
  end

  it "should have a link to edit the user's story" do
    click_link "Profile"
    expect(page).to have_link("edit-story")
  end

  it "should not have a link to edit the user's story if I'm not logged in" do
    logout
    visit(user_path(@user))
    expect(page).to_not have_link("edit-story")
  end

  it "should allow me to click the edit link" do
    click_link "Profile"
    click_link("edit-story")
    expect(page).to have_content("Edit your story")
  end

  it "should allow me to edit the story" do
    click_link "Profile"
    click_link("edit-story")
    within("form.edit_story") do
      fill_in "Body", :with => "I am playing for Jesse Foster, who died of pediatric osteogenic sarcoma in 2003"
      click_button "Update Story"
    end
    expect(page.current_path).to eq(user_path(@user))
    expect(page).to have_content("Jesse Foster")
  end

end



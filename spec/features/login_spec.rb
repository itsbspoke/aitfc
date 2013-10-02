require 'spec_helper'

describe "Creating an account" do

  context "in error cases" do

    it "should not create a new user" do
      visit root_path
      click_link "Sign Up"
      lambda{
        within("#new_user") do
          #fill_in "Email", :with => Forgery(:internet).email_address
          fill_in "Password", :with => "12345678"
          fill_in "Password confirmation", :with => "12345678"
          click_button "Sign up"
        end
        expect(page).to have_content("error")
      }.should_not change(User, :count)
    end

  end

  context "when successful" do

    it "should create a new user" do
      visit root_path
      click_link "Sign Up"
      lambda{
        within("#new_user") do
          fill_in "Email", :with => Forgery(:internet).email_address
          fill_in "Password", :with => "12345678"
          fill_in "Password confirmation", :with => "12345678"
          click_button "Sign up"
        end
        expect(page).to have_content "Welcome"
      }.should change(User, :count).by(1)
    end

  end
end


describe "Logging in" do


  before(:each) do

  end

  context "in error cases" do

    it "should not allow a login" do
      User.destroy_all
      signup("jim@jimvanfleet.com")
      logout
      visit root_path
      click_link "Sign In"
      lambda{
        within("#new_user") do
          #fill_in "Email", :with => Forgery(:internet).email_address
          fill_in "Password", :with => "12345678"
          click_button "Sign in"
        end
        expect(page).to have_content("Invalid")
      }.should_not change(User, :count)
    end
  end

  context "when successful" do

  end

end


require 'spec_helper'

describe "Creating an account" do

  context "in error cases" do


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

  context "in error cases" do

  end

  context "when successful" do

  end

end


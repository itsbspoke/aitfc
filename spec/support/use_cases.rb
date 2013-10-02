def signup(email)
  visit root_path
  click_link "Sign Up"
  within("#new_user") do
    fill_in "Email", :with => email
    fill_in "Password", :with => "12345678"
    fill_in "Password confirmation", :with => "12345678"
    click_button "Sign up"
  end
end

def logout
  click_link "Sign Out"
end

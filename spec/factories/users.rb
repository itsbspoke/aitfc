FactoryGirl.define do

  factory :user do
    email Forgery(:internet).email_address
    name "Test User"
    password "12345678"
    factory :facebook_user do
      provider_uid   SecureRandom.random_number(10000000000)
    end
  end

end

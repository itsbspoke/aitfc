# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authentication do
    user
    provider "facebook"
    uid "12345678"
    name "Facebook user"
    oauth_token { SecureRandom.hex(64) }
    oauth_expires_at { 2.months.from_now }
  end
end


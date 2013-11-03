FactoryGirl.define do
  factory :event do
    start_time 2.weeks.from_now
    venue "MyString"
    sequence(:title) {|n| "All In To Fight Cancer #{n}" }
  end
end
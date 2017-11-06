FactoryGirl.define do
  factory :user do
    email "bob@yahoo.com"
    password "abcdef"
    full_name "Bob Jones"
    is_admin "no"
  end
end

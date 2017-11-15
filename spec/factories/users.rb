FactoryGirl.define do
  factory :user do
    email "bobby@gmail.com"
    password "abcdef"
    full_name "Bob Jones"
    role "user"
    status false
  end
end

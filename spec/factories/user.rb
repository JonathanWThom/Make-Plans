FactoryGirl.define do
  sequence :email do |n|
    "hello#{n}@example.com"
  end
end

FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Barker"
    email { generate(:email) }
    password "thepriceiswrongbob"
  end
end

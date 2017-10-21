FactoryGirl.define do
  factory :activity do
    user
    description "4 hours of unhappiness"
    location "Dungeness Golf Course"
    title "Golfing"
    happening_at_string "10/21/2017 3:10 PM"
  end
end

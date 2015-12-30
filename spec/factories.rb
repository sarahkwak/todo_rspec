FactoryGirl.define do
  factory :todo do
    contents "Make a cup of Tea"
    user_id 1
  end
end

FactoryGirl.define do
  sequence :email do |n| 
    "email#{n}@factorygirl.com"
  end 

  factory :user do
    email 
    name                  { 'factory' }
    password              { "password" }
    password_confirmation { "password" }
  end 

end
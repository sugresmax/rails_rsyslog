FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    password { FFaker::Internet.password }
    password_confirmation { password }
  end
end

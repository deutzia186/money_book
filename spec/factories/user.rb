FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 6)
    name {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {"000000"}
    password_confirmation {"000000"}
  end
end
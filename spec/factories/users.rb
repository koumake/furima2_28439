FactoryBot.define do
    factory :user do
       firstname {Faker::Name.last_name}
       lastname {Faker::Name.first_name}
       email {Faker::Internet.email}
       nickname {Faker::Internet.user_name}
       birthday {Faker::Time}
       password = Faker::Internet.password(min_length: 8)
       password {password}

    end
end
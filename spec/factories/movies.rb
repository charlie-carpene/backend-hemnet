FactoryBot.define do
    factory :movie do
      title { Faker::Movie.title }
      year { Faker::Number.number(digits: 4) }
      poster { Faker::Internet.url }
      association :category
    end
end
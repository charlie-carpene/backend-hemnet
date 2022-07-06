FactoryBot.define do
    factory :category do
      name { ["movie", "episode", "series"].sample }
    end
end
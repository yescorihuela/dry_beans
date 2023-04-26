FactoryBot.define do
  factory :route do
    name { Faker::Alphanumeric.alphanumeric(number: 12, min_alpha: 3, min_numeric: 3).upcase }
    active { true }
  end

  factory :invalid_route, class: Route do
    name { Faker::Alphanumeric.alphanumeric(number: 2, min_alpha: 1, min_numeric: 1).upcase }
    active { false }
  end
end
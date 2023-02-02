# frozen_string_literal: true

FactoryBot.define do
  factory :ownership do
    car
    person
    date_of_sale { rand(1..1_000).days.ago.to_date }
    price { [100, 1_000, 2_000, 5_000, 10_000].sample }
    mileage { [50_000, 100_000, 150_000].sample }
  end
end

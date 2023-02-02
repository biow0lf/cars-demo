# frozen_string_literal: true

FactoryBot.define do
  factory :ownership do
    car
    person
    date_of_sale { "2023-02-01" }
    price { 1 }
    mileage { 1 }
  end
end

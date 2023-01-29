# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }

    sequence :email do |n|
      "person#{n}@example.com"
    end
  end
end

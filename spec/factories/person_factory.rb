# frozen_string_literal: true

FactoryBot.define do
  factory :person do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }

    sequence :email do |n|
      "person#{n}@example.com"
    end

    phone { Faker::PhoneNumber.cell_phone_in_e164 }
  end
end

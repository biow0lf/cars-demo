# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    # owner factory: :person
    # owner { association :person }

    # model, make, color, mileage, owner

    for_sale { [true, false].sample }
  end
end

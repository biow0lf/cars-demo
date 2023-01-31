# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    owner factory: :person

    # model
    # make

    color { ["black", "white", "pink", "green"].sample }

    # mileage

    for_sale { [true, false].sample }
  end
end

# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    owner factory: :person

    make { ["Tesla", "Toyota"].sample }

    # "Model S", "Model 3" -- Tesla
    # "Prius", "Camry" -- Toyota
    model { ["Model S", "Model 3", "Prius", "Camry"] }

    color { ["black", "white", "pink", "green"].sample }

    # mileage

    for_sale { [true, false].sample }
  end
end

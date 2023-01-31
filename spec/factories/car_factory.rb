# frozen_string_literal: true

FactoryBot.define do
  factory :car do
    owner factory: :person

    make { ["Tesla", "Toyota"].sample }

    # "Model S", "Model 3" -- Tesla
    # "Prius", "Camry" -- Toyota
    model { ["Model S", "Model 3", "Prius", "Camry"].sample }

    color { ["black", "white", "pink", "green"].sample }

    mileage { [1_000, 10_000, 20_000, 50_000, 100_000].sample }

    for_sale { [true, false].sample }
  end
end

# frozen_string_literal: true

require "rails_helper"

describe "Update car features" do
  it "should update car" do
    car = create(:car,
      make: "Tesla",
      model: "Model 3",
      color: "black",
      mileage: 10_000,
      for_sale: false)

    expect(Car.count).to eq(1)

    visit edit_car_path(car)

    fill_in "Car make", with: "Toyota"

    fill_in "Car model", with: "Prius"

    fill_in "Car color", with: "white"

    fill_in "Car mileage", with: "20000"

    check "Car for sale?"

    click_button "Update Car"

    find("#ownerships")

    expect(Car.count).to eq(1)

    expect(Car.first.make).to eq("Toyota")

    expect(Car.first.model).to eq("Prius")

    expect(Car.first.color).to eq("white")

    expect(Car.first.mileage).to eq(20_000)

    expect(Car.first.for_sale).to eq(true)
  end
end

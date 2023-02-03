# frozen_string_literal: true

require "rails_helper"

describe "Create car features" do
  # it "should create new car" do
  #   create(:person, name: "John Snow")
  #
  #   expect(Car.count).to eq(0)
  #
  #   visit new_car_path
  #
  #   fill_in "Car make", with: "Tesla"
  #
  #   fill_in "Car model", with: "Model 3"
  #
  #   fill_in "Car color", with: "black"
  #
  #   fill_in "Car mileage", with: "50000"
  #
  #   click_button "Create Car"
  #
  #
  #   binding.pry
  #
  #   expect(Car.count).to eq(1)
  #
  #   expect(Car.first.make).to eq("Tesla")
  #
  #   expect(Car.first.model).to eq("Model 3")
  #
  #   expect(Car.first.color).to eq("black")
  #
  #   expect(Car.first.mileage).to eq("50000")
  # end

  it "should show errors" do
    create(:person, name: "John Snow")

    expect(Car.count).to eq(0)

    visit new_car_path

    fill_in "Car make", with: "Tesla"

    fill_in "Car model", with: "Model 3"

    fill_in "Car color", with: "black"

    fill_in "Car mileage", with: "50000"

    click_button "Create Car"

    page.assert_text "Owner must exist"

    expect(Car.count).to eq(0)
  end
end

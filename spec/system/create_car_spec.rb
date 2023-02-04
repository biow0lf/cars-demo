# frozen_string_literal: true

require "rails_helper"

describe "Create car features" do
  it "should create new car" do
    person = create(:person, name: "John Snow")

    expect(Car.count).to eq(0)

    expect(Ownership.count).to eq(0)

    visit new_car_path

    fill_in "Car make", with: "Tesla"

    fill_in "Car model", with: "Model 3"

    fill_in "Car color", with: "black"

    fill_in "Car mileage", with: "50000"

    check "Car for sale?"

    select "John Snow", from: "car_person_id"

    click_button "Create Car"

    find("#ownerships")

    page.assert_text "Car was successfully created."

    expect(Car.first.make).to eq("Tesla")

    expect(Car.first.model).to eq("Model 3")

    expect(Car.first.color).to eq("black")

    expect(Car.first.mileage).to eq(50_000)

    expect(Car.first.for_sale).to eq(true)

    expect(Car.first.person_id).to eq(person.id)

    expect(Ownership.first.car).to eq(Car.first)

    expect(Ownership.first.person).to eq(person)
  end

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

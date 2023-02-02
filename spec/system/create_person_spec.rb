# frozen_string_literal: true

require "rails_helper"

describe "Create person features" do
  it "should create new person" do
    expect(Person.count).to eq(0)

    visit new_person_path

    fill_in "Person name", with: "John Snow"

    fill_in "Person email address", with: "john@example.com"

    fill_in "Person phone number", with: "+380631112233"

    click_button "Create Person"

    expect(Person.count).to eq(1)
  end
end

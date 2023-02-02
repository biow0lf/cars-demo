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

    find("#ownerships")

    expect(Person.count).to eq(1)

    expect(Person.first.name).to eq("John Snow")

    expect(Person.first.email).to eq("john@example.com")

    expect(Person.first.phone).to eq("+380631112233")
  end

  # it "should show errors" do
  #   create(:person, email: "john@example.com")
  #
  #   expect(Person.count).to eq(1)
  #
  #   visit new_person_path
  #
  #   fill_in "Person name", with: "John Snow"
  #
  #   fill_in "Person email address", with: "john@example.com"
  #
  #   fill_in "Person phone number", with: "+380631112233"
  #
  #   click_button "Create Person"
  #
  #   expect(Person.count).to eq(1)
  # end
end

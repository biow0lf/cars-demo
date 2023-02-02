# frozen_string_literal: true

require "rails_helper"

describe "Edit person features" do
  it "should update person" do
    person = create(:person,
      name: "John Snow",
      email: "john@example.com",
      phone: "+380631112233")

    expect(Person.count).to eq(1)

    visit edit_person_path(person)

    fill_in "Person name", with: "Jane Snow"

    fill_in "Person email address", with: "jane@example.com"

    fill_in "Person phone number", with: "+380632221133"

    click_button "Update Person"

    find("#ownerships")

    expect(Person.count).to eq(1)

    expect(Person.first.name).to eq("Jane Snow")

    expect(Person.first.email).to eq("jane@example.com")

    expect(Person.first.phone).to eq("+380632221133")
  end
end

# frozen_string_literal: true

require "rails_helper"

describe "Destroy person features" do
  describe "#index" do
    it "should destroy person" do
      create(:person)

      expect(Person.count).to eq(1)

      visit people_path

      accept_confirm do
        click_link "Destroy"
      end

      page.assert_text "Person was successfully destroyed."

      expect(Person.count).to eq(0)
    end
  end

  describe "#show" do
    it "should destroy person" do
      person = create(:person)

      expect(Person.count).to eq(1)

      visit person_path(person)

      find("#ownerships")

      accept_confirm do
        click_link "Destroy"
      end

      page.assert_text "Person was successfully destroyed."

      expect(page.current_path).to eq(people_path)

      expect(Person.count).to eq(0)
    end
  end
end

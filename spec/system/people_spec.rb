# frozen_string_literal: true

require "rails_helper"

describe "People features" do
  describe "#index" do
    it "should render" do
      create_list(:person, 60)

      visit people_path
    end
  end

  describe "#show" do
    it "should render" do
      person = create(:person)

      visit person_path(person)
    end
  end

  describe "#new" do
    it "should render" do
      visit new_person_path
    end
  end

  describe "#edit" do
    it "should render" do
      person = create(:person)

      visit edit_person_path(person)
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

describe "Destroy car features" do
  describe "#index" do
    it "should destroy car" do
      create(:car)

      expect(Car.count).to eq(1)

      visit cars_path

      accept_confirm do
        click_link "Destroy"
      end

      page.assert_text "Car was successfully destroyed."

      expect(Car.count).to eq(0)
    end
  end

  describe "#show" do
    it "should destroy car" do
      car = create(:car)

      expect(Car.count).to eq(1)

      visit car_path(car)

      find("#ownerships")

      accept_confirm do
        click_link "Destroy"
      end

      page.assert_text "Car was successfully destroyed."

      expect(page.current_path).to eq(cars_path)

      expect(Car.count).to eq(0)
    end
  end
end

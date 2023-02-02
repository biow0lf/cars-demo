# frozen_string_literal: true

require "rails_helper"

describe "Cars features" do
  describe "#index" do
    it "should render" do
      create_list(:car, 10)

      visit cars_path
    end
  end

  describe "#show" do
    it "should render" do
      car = create(:car)

      visit car_path(car)
    end
  end

  describe "#new" do
    it "should render" do
      visit new_car_path
    end
  end

  describe "#edit" do
    it "should render" do
      car = create(:car)

      visit edit_car_path(car)
    end
  end
end

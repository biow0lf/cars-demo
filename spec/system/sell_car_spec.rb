# frozen_string_literal: true

require "rails_helper"

describe "Sell car features" do
  it "should change car owner" do
    car = create(:car)

    visit car_sell_path(car)

    # TODO: check sell button
  end
end

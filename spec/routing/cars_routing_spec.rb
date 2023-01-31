# frozen_string_literal: true

require "rails_helper"

describe CarsController do
  describe "routing" do
    it "should route GET /cars to cars#index" do
      expect(get: "/cars").to route_to(
        controller: "cars",
        action: "index"
      )
    end
  end
end

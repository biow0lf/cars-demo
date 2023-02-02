# frozen_string_literal: true

require "rails_helper"

describe CarOwnershipsHistoryController do
  describe "routing" do
    it "should route GET /cars/:car_id/car_ownerships_history to car_ownerships_history#index" do
      expect(get: "/cars/1/car_ownerships_history").to route_to(
        controller: "car_ownerships_history",
        action: "index",
        car_id: "1"
      )
    end
  end
end

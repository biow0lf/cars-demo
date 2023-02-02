# frozen_string_literal: true

require "rails_helper"

describe PersonCarOwnershipsHistoryController do
  describe "routing" do
    it "should route GET /people/:person_id/person_car_ownerships_history to person_car_ownerships_history#index" do
      expect(get: "/people/1/person_car_ownerships_history").to route_to(
        controller: "person_car_ownerships_history",
        action: "index",
        person_id: "1"
      )
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

describe SellsController do
  describe "routing" do
    it "should route GET /cars/:car_id/sell/new to sells#new" do
      expect(get: "/cars/1/sell/new").to route_to(
        controller: "sells",
        action: "new",
        car_id: "1"
      )
    end

    it "should route POST /cars/:car_id/sell to sells#create" do
      expect(post: "/cars/1/sell").to route_to(
        controller: "sells",
        action: "create",
        car_id: "1"
      )
    end
  end
end

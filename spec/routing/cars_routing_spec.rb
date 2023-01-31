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

    it "should route GET /cars/new to cars#new" do
      expect(get: "/cars/new").to route_to(
        controller: "cars",
        action: "new"
      )
    end

    it "should route GET /cars/1 to cars#show" do
      expect(get: "/cars/1").to route_to(
        controller: "cars",
        action: "show",
        id: "1"
      )
    end

    it "should route GET /cars/1/edit to cars#edit" do
      expect(get: "/cars/1/edit").to route_to(
        controller: "cars",
        action: "edit",
        id: "1"
      )
    end

    it "should route POST /cars to cars#create" do
      expect(post: "/cars").to route_to(
        controller: "cars",
        action: "create"
      )
    end

    it "should route PUT /cars/1 to cars#update" do
      expect(put: "/cars/1").to route_to(
        controller: "cars",
        action: "update",
        id: "1"
      )
    end

    it "should route PATCH /cars/1 to cars#update" do
      expect(patch: "/cars/1").to route_to(
        controller: "cars",
        action: "update",
        id: "1"
      )
    end

    it "should route DELETE /cars/1 to cars#destroy" do
      expect(delete: "/cars/1").to route_to(
        controller: "cars",
        action: "destroy",
        id: "1"
      )
    end
  end
end

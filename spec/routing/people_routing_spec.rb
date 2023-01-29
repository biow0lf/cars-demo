# frozen_string_literal: true

require "rails_helper"

describe PeopleController do
  describe "routing" do
    it "should route GET /people to people#index" do
      expect(get: "/people").to route_to(
        controller: "people",
        action: "index"
      )
    end

    it "should route GET /people/new to people#new" do
      expect(get: "/people/new").to route_to(
        controller: "people",
        action: "new"
      )
    end

    it "should route GET /people/1 to people#show" do
      expect(get: "/people/1").to route_to(
        controller: "people",
        action: "show",
        id: "1"
      )
    end

    it "should route GET /people/1/edit to people#edit" do
      expect(get: "/people/1/edit").to route_to(
        controller: "people",
        action: "edit",
        id: "1"
      )
    end

    it "should route POST /people to people#create" do
      expect(post: "/people").to route_to(
        controller: "people",
        action: "create"
      )
    end

    it "should route PUT /people/1 to people#update" do
      expect(put: "/people/1").to route_to(
        controller: "people",
        action: "update",
        id: "1"
      )
    end

    it "should route PATCH /people/1 to people#update" do
      expect(patch: "/people/1").to route_to(
        controller: "people",
        action: "update",
        id: "1"
      )
    end

    it "should route DELETE /people/1 to people#destroy" do
      expect(delete: "/people/1").to route_to(
        controller: "people",
        action: "destroy",
        id: "1"
      )
    end
  end
end

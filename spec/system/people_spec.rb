# frozen_string_literal: true

require "rails_helper"

describe "People features" do
  describe "#index" do
    it "should render" do
      create_list(:person, 30)

      visit people_path
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

describe CarOwnershipsHistoryController do
  it { should be_an(ApplicationController) }

  describe "#index" do
    before { get :index, params: {car_id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:index) }
  end
end

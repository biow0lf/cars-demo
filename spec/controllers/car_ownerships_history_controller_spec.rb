# frozen_string_literal: true

require "rails_helper"

describe CarOwnershipsHistoryController do
  it { should be_an(ApplicationController) }

  describe "#index" do
    before do
      #
      # Car.includes(ownerships: :person).find(params[:car_id])
      #
      expect(Car).to receive(:includes).with(ownerships: :person) do
        double.tap do |a|
          expect(a).to receive(:find).with("1")
        end
      end
    end

    before { get :index, params: {car_id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:index) }
  end
end

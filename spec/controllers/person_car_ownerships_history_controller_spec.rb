# frozen_string_literal: true

require "rails_helper"

describe PersonCarOwnershipsHistoryController do
  it { should be_an(ApplicationController) }

  describe "#index" do
    before do
      #
      # Person.includes(ownerships: :car).find(params[:person_id])
      #
      expect(Person).to receive(:includes).with(ownerships: :car) do
        double.tap do |a|
          expect(a).to receive(:find).with("1")
        end
      end
    end

    before { get :index, params: {person_id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:index) }
  end
end

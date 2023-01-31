# frozen_string_literal: true

require "rails_helper"

describe CarsController do
  it { should be_an(ApplicationController) }

  describe "#index" do
    before do
      #
      # Car.page(params[:page])
      #
      expect(Car).to receive(:page).with("1")
    end

    before { get :index, params: {page: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:index) }
  end
end

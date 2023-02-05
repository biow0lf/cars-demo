# frozen_string_literal: true

require "rails_helper"

describe SellsController do
  it { should be_an(ApplicationController) }

  describe "#new" do
    before { expect(Car).to receive(:find).with("2") }

    before { expect(Person).to receive(:pluck).with(:name, :id) }

    before { expect(Ownership).to receive(:new) }

    before { get :new, params: {car_id: "2"} }

    it { should respond_with(:ok) }

    it { should render_template(:new) }
  end

  describe "#create" do
  end
end

# frozen_string_literal: true

require "rails_helper"

describe PeopleController do
  it { should be_an(ApplicationController) }

  describe "#index" do
    before do
      #
      # Person.page(params[:page])
      #
      expect(Person).to receive(:page).with("1")
    end

    before { get :index, params: {page: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:index) }
  end

  describe "#destroy" do
    let(:person) { instance_double(Person) }

    before do
      #
      # Person.find(params[:id]) # => person
      #
      expect(Person).to receive(:find).with("1").and_return(person)
    end

    before { expect(person).to receive(:destroy!) }

    context "when format turbo stream" do
      before { delete :destroy, params: {id: "1", format: "turbo_stream"} }

      it { should respond_with(:ok) }

      it { should render_template(:destroy) }

      it { should set_flash.now[:notice].to("Person was successfully destroyed.") }
    end

    context "when format html" do
      before { delete :destroy, params: {id: "1", format: "html"} }

      it { should respond_with(:see_other) }

      it { should redirect_to(people_path) }

      it { should set_flash[:notice].to("Person was successfully destroyed.") }
    end
  end
end

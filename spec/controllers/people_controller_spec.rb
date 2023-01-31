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

  describe "#show" do
    before { expect(Person).to receive(:find).with("1") }

    before { get :show, params: {id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:show) }
  end

  describe "#new" do
    before { expect(Person).to receive(:new) }

    before { get :new }

    it { should respond_with(:ok) }

    it { should render_template(:new) }
  end

  describe "#edit" do
    before { expect(Person).to receive(:find).with("1") }

    before { get :edit, params: {id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:edit) }
  end

  describe "#create" do
    # def create
    #   @person = Person.new(person_params)
    #
    #   if @person.save
    #     redirect_to person_path(@person), notice: t(".successful")
    #   else
    #     render :new, status: :unprocessable_entity
    #   end
    # end
  end

  describe "#update" do
    # @person = Person.find(params[:id])
    #
    # if @person.update(person_params)
    #   redirect_to person_path(@person), notice: t(".successful")
    # else
    #   render :edit, status: :unprocessable_entity
    # end

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

  # private methods

  describe "#person_params" do
    before do
      #
      # params.require(:person).permit(:name, :email, :phone)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:require).with(:person) do
            double.tap do |b|
              expect(b).to receive(:permit).with(:name, :email, :phone)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:person_params) }.not_to raise_error }
  end

  # def person_params
  #   params.require(:person).permit(:name, :email, :phone)
  # end

end

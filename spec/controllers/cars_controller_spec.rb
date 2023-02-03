# frozen_string_literal: true

require "rails_helper"

describe CarsController do
  it { should be_an(ApplicationController) }

  describe "#index" do
    before do
      #
      # Car.includes(:owner).page(params[:page])
      #
      expect(Car).to receive(:includes).with(:owner) do
        double.tap do |a|
          expect(a).to receive(:page).with("1")
        end
      end
    end

    before { get :index, params: {page: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:index) }
  end

  describe "#show" do
    before { expect(Car).to receive(:find).with("1") }

    before { get :show, params: {id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:show) }
  end

  describe "#new" do
    before { expect(Car).to receive(:new) }

    before { expect(Person).to receive(:pluck).with(:name, :id) }

    before { get :new }

    it { should respond_with(:ok) }

    it { should render_template(:new) }
  end

  describe "#edit" do
    before { expect(Car).to receive(:find).with("1") }

    before { expect(Person).to receive(:pluck).with(:name, :id) }

    before { get :edit, params: {id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:edit) }
  end

  describe "#create" do
    let(:car) { instance_double(Car, to_param: "1") }

    before do
      #
      # Car.new(car_params) # => car
      #
      expect(Car).to receive(:new)
        .with(ActionController::Parameters.new(model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1").permit!)
        .and_return(car)
    end

    before { expect(Person).to receive(:pluck).with(:name, :id) }

    context "when car valid" do
      before { expect(car).to receive(:save).and_return(true) }

      before { post :create, params: {car: {model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1"}} }

      it { should respond_with(:found) }

      it { should redirect_to(car_path(car)) }

      it { should set_flash[:notice].to("Car was successfully created.") }
    end

    context "when car not valid" do
      before { expect(car).to receive(:save).and_return(false) }

      before { post :create, params: {car: {model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1"}} }

      it { should respond_with(:unprocessable_entity) }

      it { should render_template(:new) }
    end
  end

  describe "#update" do
    context "when person valid" do
      let(:car) { instance_double(Car, to_param: "1") }

      before do
        #
        # Car.find(params[:id]) # => car
        #
        expect(Car).to receive(:find).with("1").and_return(car)
      end

      before { expect(Person).to receive(:pluck).with(:name, :id) }

      before do
        #
        # car.update(car_params)
        #
        expect(car).to receive(:update)
          .with(ActionController::Parameters.new(model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1").permit!)
          .and_return(true)
      end

      before { put :update, params: {id: "1", car: {model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1"}} }

      it { should respond_with(:found) }

      it { should redirect_to(car_path(car)) }

      it { should set_flash[:notice].to("Car was successfully updated.") }
    end

    context "when person not valid" do
      let(:car) { instance_double(Car) }

      before do
        #
        # Car.find(params[:id]) # => car
        #
        expect(Car).to receive(:find).with("1").and_return(car)
      end

      before do
        #
        # car.update(car_params)
        #
        expect(car).to receive(:update)
          .with(ActionController::Parameters.new(model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1").permit!)
          .and_return(false)
      end

      before { put :update, params: {id: "1", car: {model: "Model", make: "Make", color: "pink", mileage: "999", for_sale: "1"}} }

      it { should respond_with(:unprocessable_entity) }

      it { should render_template(:edit) }
    end
  end

  describe "#destroy" do
    let(:car) { instance_double(Car) }

    before do
      #
      # Car.find(params[:id]) # => car
      #
      expect(Car).to receive(:find).with("1").and_return(car)
    end

    before { expect(car).to receive(:destroy!) }

    context "when format turbo stream" do
      before { delete :destroy, params: {id: "1", format: "turbo_stream"} }

      it { should respond_with(:ok) }

      it { should render_template(:destroy) }

      it { should set_flash.now[:notice].to("Car was successfully destroyed.") }
    end

    context "when format html" do
      before { delete :destroy, params: {id: "1", format: "html"} }

      it { should respond_with(:see_other) }

      it { should redirect_to(cars_path) }

      it { should set_flash[:notice].to("Car was successfully destroyed.") }
    end
  end

  # private methods

  describe "#car_params" do
    before do
      #
      # params.require(:car).permit(:model, :make, :color, :mileage, :for_sale, :person_id)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:require).with(:car) do
            double.tap do |b|
              expect(b).to receive(:permit).with(:model, :make, :color, :mileage, :for_sale, :person_id)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:car_params) }.not_to raise_error }
  end
end

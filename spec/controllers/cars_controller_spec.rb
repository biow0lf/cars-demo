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

  describe "#show" do
    before { expect(Car).to receive(:find).with("1") }

    before { get :show, params: {id: "1"} }

    it { should respond_with(:ok) }

    it { should render_template(:show) }
  end

  describe "#new" do
    before { expect(Car).to receive(:new) }

    before { get :new }

    it { should respond_with(:ok) }

    it { should render_template(:new) }
  end

  describe "#edit" do
    before { expect(Car).to receive(:find).with("1") }

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

  # describe "#update" do
  #   context "when person valid" do
  #     let(:person) { instance_double(Person, to_param: "1") }
  #
  #     before do
  #       #
  #       # Person.find(params[:id]) # => person
  #       #
  #       expect(Person).to receive(:find).with("1").and_return(person)
  #     end
  #
  #     before do
  #       #
  #       # person.update(person_params)
  #       #
  #       expect(person).to receive(:update)
  #                           .with(ActionController::Parameters.new(name: "John", email: "john@example.com", phone: "+380631112233").permit!)
  #                           .and_return(true)
  #     end
  #
  #     before { put :update, params: {id: "1", person: {name: "John", email: "john@example.com", phone: "+380631112233"}} }
  #
  #     it { should respond_with(:found) }
  #
  #     it { should redirect_to(person_path(person)) }
  #
  #     it { should set_flash[:notice].to("Person was successfully updated.") }
  #   end
  #
  #   context "when person not valid" do
  #     let(:person) { instance_double(Person) }
  #
  #     before do
  #       #
  #       # Person.find(params[:id]) # => person
  #       #
  #       expect(Person).to receive(:find).with("1").and_return(person)
  #     end
  #
  #     before do
  #       #
  #       # person.update(person_params)
  #       #
  #       expect(person).to receive(:update)
  #                           .with(ActionController::Parameters.new(name: "John", email: "john@example.com", phone: "+380631112233").permit!)
  #                           .and_return(false)
  #     end
  #
  #     before { put :update, params: {id: "1", person: {name: "John", email: "john@example.com", phone: "+380631112233"}} }
  #
  #     it { should respond_with(:unprocessable_entity) }
  #
  #     it { should render_template(:edit) }
  #   end
  # end
  #
  # describe "#destroy" do
  #   let(:person) { instance_double(Person) }
  #
  #   before do
  #     #
  #     # Person.find(params[:id]) # => person
  #     #
  #     expect(Person).to receive(:find).with("1").and_return(person)
  #   end
  #
  #   before { expect(person).to receive(:destroy!) }
  #
  #   context "when format turbo stream" do
  #     before { delete :destroy, params: {id: "1", format: "turbo_stream"} }
  #
  #     it { should respond_with(:ok) }
  #
  #     it { should render_template(:destroy) }
  #
  #     it { should set_flash.now[:notice].to("Person was successfully destroyed.") }
  #   end
  #
  #   context "when format html" do
  #     before { delete :destroy, params: {id: "1", format: "html"} }
  #
  #     it { should respond_with(:see_other) }
  #
  #     it { should redirect_to(people_path) }
  #
  #     it { should set_flash[:notice].to("Person was successfully destroyed.") }
  #   end
  # end

  # private methods

  describe "#car_params" do
    before do
      #
      # params.require(:car).permit(:model, :make, :color, :mileage, :for_sale)
      #
      expect(subject).to receive(:params) do
        double.tap do |a|
          expect(a).to receive(:require).with(:car) do
            double.tap do |b|
              expect(b).to receive(:permit).with(:model, :make, :color, :mileage, :for_sale)
            end
          end
        end
      end
    end

    specify { expect { subject.send(:car_params) }.not_to raise_error }
  end
end

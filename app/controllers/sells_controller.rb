# frozen_string_literal: true

class SellsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @people = Person.pluck(:name, :id)
    @ownership = Ownership.new
  end

  def create
    @car = Car.find(params[:car_id])
    @people = Person.pluck(:name, :id)
    @person = Person.find(params.dig(:ownership, :person_id))
    @ownership = Ownership.new(car: @car, person: @person)

    if @ownership.save
      redirect_to car_path(@car), notice: t(".successful")
    else
      render :new, status: :unprocessable_entity
    end
  end
end

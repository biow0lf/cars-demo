# frozen_string_literal: true

class CarsController < ApplicationController
  def index
    @cars = Car.includes(:owner).page(params[:page])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
    @people = Person.pluck(:name, :id)
  end

  def edit
    @car = Car.find(params[:id])
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to car_path(@car), notice: t(".successful")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to car_path(@car), notice: t(".successful")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy!

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = t(".successful") }
      format.html { redirect_to cars_path, status: :see_other, notice: t(".successful") }
    end
  end

  private

  def car_params
    # TODO: person_id
    params.require(:car).permit(:model, :make, :color, :mileage, :for_sale)
  end
end

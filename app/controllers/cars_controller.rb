# frozen_string_literal: true

class CarsController < ApplicationController
  def index
    @cars = Car.page(params[:page])
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @car = Car.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end

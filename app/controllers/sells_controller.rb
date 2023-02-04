# frozen_string_literal: true

class SellsController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @people = Person.pluck(:name, :id)
  end

  def create
  end
end

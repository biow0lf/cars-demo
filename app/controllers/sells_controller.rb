# frozen_string_literal: true

class SellsController < ApplicationController
  def show
    @car = Car.find(params[:car_id])
  end

  def create
  end
end

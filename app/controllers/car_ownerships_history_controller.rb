# frozen_string_literal: true

class CarOwnershipsHistoryController < ApplicationController
  def index
    @car = Car.find(params[:car_id])
  end
end

# frozen_string_literal: true

class CarOwnershipsHistoryController < ApplicationController
  def index
    @car = Car.includes(ownerships: :person).find(params[:car_id])
  end
end

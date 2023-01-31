# frozen_string_literal: true

class CarsController < ApplicationController
  def index
    @cars = Car.page(params[:page])
  end
end

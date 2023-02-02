# frozen_string_literal: true

class PersonCarHistoryController < ApplicationController
  def show
    @person = Person.find(params[:id])
  end
end

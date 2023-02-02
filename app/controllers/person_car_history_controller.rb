# frozen_string_literal: true

class PersonCarHistoryController < ApplicationController
  def show
    @person = Person.includes(ownerships: :car).find(params[:id])
  end
end

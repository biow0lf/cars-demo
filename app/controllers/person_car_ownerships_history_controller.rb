# frozen_string_literal: true

class PersonCarOwnershipsHistoryController < ApplicationController
  def index
    @person = Person.includes(ownerships: :car).find(params[:person_id])
  end
end

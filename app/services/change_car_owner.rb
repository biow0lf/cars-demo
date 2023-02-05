# frozen_string_literal: true

class ChangeCarOwner
  attr_reader :car, :person

  def initialize(car, person)
    @car = car
    @person = person
  end

  def save
    return false if !valid?

    success = nil

    Car.transaction do
      begin
        car.update!(owner: person)
        Ownership.create!(car: @car, person: @person)
        success = true
      rescue
        success = false
        raise ActiveRecord::Rollback
      end
    end

    success
  end
end

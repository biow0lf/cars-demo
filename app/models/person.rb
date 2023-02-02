# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :cars, dependent: :destroy

  has_many :ownerships, dependent: :destroy

  # has_many :sold_cars, through: :ownerships, class_name: "Car"
end

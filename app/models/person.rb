# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :cars, dependent: :destroy

  has_many :ownerships, dependent: :destroy
end

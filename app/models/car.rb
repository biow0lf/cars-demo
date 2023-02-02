# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :owner,
    class_name: "Person",
    foreign_key: "person_id",
    inverse_of: :cars

  has_many :ownerships, dependent: :destroy

  validates :make, presence: true
  validates :model, presence: true
  validates :color, presence: true
  validates :mileage, presence: true
end

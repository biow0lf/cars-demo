# frozen_string_literal: true

class Car < ApplicationRecord
  belongs_to :owner,
    class_name: "Person",
    foreign_key: "person_id",
    inverse_of: :cars
end

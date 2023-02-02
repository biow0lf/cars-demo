# frozen_string_literal: true

class Ownership < ApplicationRecord
  belongs_to :car

  belongs_to :person
end

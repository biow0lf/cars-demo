# frozen_string_literal: true

class Person < ApplicationRecord
  has_many :cars, dependent: :destroy

  has_many :ownerships, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :email, format: /\A[^@\s]+@[^@\s]+\z/
  validates :email, uniqueness: {case_sensitive: false}
end

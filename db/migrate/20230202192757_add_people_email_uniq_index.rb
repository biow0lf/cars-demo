# frozen_string_literal: true

class AddPeopleEmailUniqIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :people, :email, unique: true
  end
end

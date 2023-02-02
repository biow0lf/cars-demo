# frozen_string_literal: true

class CreateOwnerships < ActiveRecord::Migration[7.0]
  def change
    create_table :ownerships do |t|
      t.references :car, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true
      t.date :date_of_sale
      t.integer :price
      t.integer :mileage

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.string :color
      t.bigint :mileage
      t.references :person, foreign_key: true
      t.boolean :for_sale

      t.timestamps
    end
  end
end

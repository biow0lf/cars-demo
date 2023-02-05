# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "progress_bar"

bar = ProgressBar.new(100)

100.times do
  person = FactoryBot.create(:person)

  FactoryBot.create(:car, owner: person)

  bar.increment!
end

Person.find_each do |person|
  Car.find_each do |car|
    FactoryBot.create(:ownership, person: person, car: car)
  end
end

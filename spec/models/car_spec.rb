# frozen_string_literal: true

require "rails_helper"

describe Car do
  it { should be_an(ApplicationRecord) }

  it { should belong_to(:owner).class_name("Person").with_foreign_key("person_id").inverse_of(:cars) }

  it { should have_many(:ownerships).dependent(:destroy) }

  it { should validate_presence_of(:make) }

  it { should validate_presence_of(:model) }

  it { should validate_presence_of(:color) }

  it { should validate_presence_of(:mileage) }
end

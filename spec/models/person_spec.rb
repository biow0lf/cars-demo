# frozen_string_literal: true

require "rails_helper"

describe Person do
  it { should be_an(ApplicationRecord) }

  it { should have_many(:cars).dependent(:destroy) }

  it { should have_many(:ownerships).dependent(:destroy) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_presence_of(:phone) }
end

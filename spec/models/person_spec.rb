# frozen_string_literal: true

require "rails_helper"

describe Person do
  it { should be_an(ApplicationRecord) }

  it { should have_many(:cars).dependent(:destroy) }

  it { should have_many(:ownerships).dependent(:destroy) }
end

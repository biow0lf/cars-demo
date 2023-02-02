# frozen_string_literal: true

require "rails_helper"

describe Ownership do
  it { should be_an(ApplicationRecord) }

  it { should belong_to(:car) }

  it { should belong_to(:person) }
end

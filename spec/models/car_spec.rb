# frozen_string_literal: true

require "rails_helper"

describe Car do
  it { should be_an(ApplicationRecord) }

  it { should belong_to(:owner).class_name("Person").with_foreign_key("person_id").inverse_of(:cars) }
end

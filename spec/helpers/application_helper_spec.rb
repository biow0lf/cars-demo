# frozen_string_literal: true

require "rails_helper"

describe ApplicationHelper do
  describe "#yes_or_no" do
    context "when true" do
      specify { expect(helper.yes_or_no(true)).to eq("Yes") }
    end

    context "when false" do
      specify { expect(helper.yes_or_no(false)).to eq("No") }
    end

    context "when nil" do
      specify { expect(helper.yes_or_no(false)).to eq("No") }
    end
  end
end

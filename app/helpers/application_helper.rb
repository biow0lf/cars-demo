# frozen_string_literal: true

module ApplicationHelper
  def yes_or_no(value)
    value == true ? "Yes" : "No"
  end
end

# frozen_string_literal: true

class NestedFieldTest < ApplicationRecord
  has_paper_trail

  belongs_to :field_test, inverse_of: :nested_field_tests
end

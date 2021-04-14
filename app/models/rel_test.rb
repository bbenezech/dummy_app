# frozen_string_literal: true

class RelTest < ApplicationRecord
  has_paper_trail

  validates :player_id, numericality: { only_integer: true }
  belongs_to :league
  belongs_to :division
  belongs_to :player
end

# frozen_string_literal: true

class Draft < ApplicationRecord
  has_paper_trail

  validates :player_id, numericality: { only_integer: true }
  validates :team_id, numericality: { only_integer: true }
  validates :date, presence: true
  validates :round, numericality: { only_integer: true }
  validates :pick, numericality: { only_integer: true }
  validates :overall, numericality: { only_integer: true }

  belongs_to(:team)
  belongs_to(:player)
end

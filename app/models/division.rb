# frozen_string_literal: true

class Division < ApplicationRecord
  has_paper_trail

  self.primary_key = :custom_id
  validates :custom_league_id, numericality: { only_integer: true }
  validates :name, presence: true

  belongs_to :league, foreign_key: 'custom_league_id', inverse_of: :divisions
  has_many :teams, dependent: :destroy
end

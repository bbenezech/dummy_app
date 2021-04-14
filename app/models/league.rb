# frozen_string_literal: true

class League < ApplicationRecord
  has_paper_trail

  validates :name, presence: true

  has_many :divisions, foreign_key: 'custom_league_id', inverse_of: :league, dependent: :destroy
  has_many :teams, -> { readonly }, through: :divisions

  def custom_name
    "League '#{name}'"
  end
end

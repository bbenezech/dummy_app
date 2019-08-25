# frozen_string_literal: true

class Team < ApplicationRecord
  has_paper_trail

  validates :division_id, numericality: { only_integer: true }
  validates :manager, presence: true
  validates :founded, numericality: { only_integer: true }
  validates :wins, numericality: { only_integer: true }
  validates :losses, numericality: { only_integer: true }
  validates :win_percentage, numericality: true
  validates :revenue, numericality: { allow_nil: true }

  belongs_to :division
  has_many :players, inverse_of: :team, dependent: :destroy
  has_and_belongs_to_many :fans
  has_many :comments, as: :commentable, dependent: :destroy

  def player_names_truncated
    players.map(&:name).join(', ')[0..32]
  end

  def color_enum
    ['white', 'black', 'red', 'green', 'blu<e>é']
  end
end

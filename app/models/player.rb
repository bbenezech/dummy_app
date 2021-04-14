# frozen_string_literal: true

class Player < ApplicationRecord
  has_paper_trail

  validates :name, presence: true
  validates :number, numericality: { only_integer: true }
  validates :number, uniqueness: { scope: :team_id, message: 'There is already a player with that number on this team' }

  validates_each :name do |record, _attr, value|
    record.errors.add(:base, 'Player is cheating') if /on steroids/.match?(value.to_s)
  end

  belongs_to :team, inverse_of: :players, dependent: :destroy
  has_one :draft, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  def draft_id
    draft.try :id
  end

  def draft_id=(id)
    self.draft = Draft.find_by(id: id)
  end
end

# frozen_string_literal: true

class Fan < ApplicationRecord
  has_paper_trail

  validates :name, presence: true
  belongs_to :fanable, polymorphic: true
  has_and_belongs_to_many :teams
end

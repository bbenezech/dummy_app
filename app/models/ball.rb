# frozen_string_literal: true

class Ball < ApplicationRecord
  has_paper_trail

  validates :color, presence: true

  def to_param
    color.present? ? color.downcase.tr(' ', '-') : id
  end
end

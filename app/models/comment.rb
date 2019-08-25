# frozen_string_literal: true

class Comment < ApplicationRecord
  has_paper_trail
  belongs_to :commentable, polymorphic: true
end

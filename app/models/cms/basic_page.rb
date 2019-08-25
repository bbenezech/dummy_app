# frozen_string_literal: true

module Cms
  class BasicPage < ApplicationRecord
    has_paper_trail

    self.table_name_prefix = :cms

    validates :title, :content, presence: true
  end
end

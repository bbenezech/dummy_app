# frozen_string_literal: true

class FieldTest < ApplicationRecord
  has_paper_trail

  has_many :nested_field_tests, dependent: :destroy, inverse_of: :field_test
  accepts_nested_attributes_for :nested_field_tests, allow_destroy: true

  has_one :comment, as: :commentable, dependent: :destroy
  accepts_nested_attributes_for :comment, allow_destroy: true

  has_attached_file :paperclip_asset, styles: { thumb: '100x100>' }
  validates_attachment_content_type :paperclip_asset, content_type: %r{\Aimage/.*\z}
  attr_accessor :delete_paperclip_asset

  before_validation { self.paperclip_asset = nil if delete_paperclip_asset == '1' }

  dragonfly_accessor :dragonfly_asset
  mount_uploader :carrierwave_asset, CarrierwaveUploader
end

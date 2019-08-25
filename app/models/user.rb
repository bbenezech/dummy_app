# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable

  serialize :roles, Array

  # Add Paperclip support for avatars
  has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :avatar, content_type: %r{\Aimage/.*\z}

  attr_accessor :delete_avatar

  before_validation { self.avatar = nil if delete_avatar == '1' }
end

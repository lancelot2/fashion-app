# frozen_string_literal: true
class Company < ApplicationRecord
  has_many :users
  mount_uploader :logo, PhotoUploader
end

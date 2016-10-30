# frozen_string_literal: true
class Company < ApplicationRecord
  mount_uploader :logo, PhotoUploader
end

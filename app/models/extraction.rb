# frozen_string_literal: true
class Extraction < ApplicationRecord
  belongs_to :user
  belongs_to :search
  belongs_to :template
end

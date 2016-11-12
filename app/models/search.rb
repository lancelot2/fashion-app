# frozen_string_literal: true
class Search < ApplicationRecord
  has_one :user, dependent: :nullify
end

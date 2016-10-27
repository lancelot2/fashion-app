class Company < ApplicationRecord
  mount_uploader :logo, PhotoUploader
end

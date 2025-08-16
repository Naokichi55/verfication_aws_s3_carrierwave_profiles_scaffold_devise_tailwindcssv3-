class Profile < ApplicationRecord
	belongs_to :user

  mount_uploader :avataor, AvataorUploader
  has_one_attached :avatar
end

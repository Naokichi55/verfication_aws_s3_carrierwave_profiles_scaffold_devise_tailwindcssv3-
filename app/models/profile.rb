class Profile < ApplicationRecord
	belongs_to :user

  mount_uploader :avataor, AvataorUploader
end

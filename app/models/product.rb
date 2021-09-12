class Product < ApplicationRecord
  acts_as_list
  acts_as_paranoid
  mount_uploader :image, ProductUploader

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
end

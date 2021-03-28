class Waterscape < ApplicationRecord
  belongs_to :user
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  has_many :likes, dependent: :destroy
end

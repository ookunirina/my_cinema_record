class Movierecord < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  mount_uploader :image_url, ImageUrlUploader

  validates :title, presence: true, length: { maximum: 100 }
  validates :genre, presence: true
  validates :review, length: { maximum: 65_535 }
end
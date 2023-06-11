class Movierecord < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :genre, presence: true
  validates :review, length: { maximum: 65_535 }
end
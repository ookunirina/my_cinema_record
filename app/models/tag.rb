class Tag < ApplicationRecord
  has_many :movierecord_tags, dependent: :destroy, foreign_key: 'tag_id'
  has_many :movierecords, through: :movierecord_tags

  validates :name, uniqueness: true, presence: true
end

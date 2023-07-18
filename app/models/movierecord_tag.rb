class MovierecordTag < ApplicationRecord
  belongs_to :movierecord
  belongs_to :tag

  validates :movierecord_id, presence: true
  validates :tag_id, presence: true
end

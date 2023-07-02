class Like < ApplicationRecord
  belongs_to :user
  belongs_to :movierecord

  validates :user_id, uniqueness: { scope: :movierecord_id }
end

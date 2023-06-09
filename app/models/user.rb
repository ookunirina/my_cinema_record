class User < ApplicationRecord
  authenticates_with_sorcery!

  mount_uploader :avatar, AvatarUploader

  has_many :movierecords, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_movierecords, through: :likes, source: :movierecord

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def own?(object)
    id == object.user_id
  end

  def like(movierecord)
    like_movierecords << movierecord
  end

  def unlike(movierecord)
    like_movierecords.destroy(movierecord)
  end

  def like?(movierecord)
    like_movierecords.include?(movierecord)
  end
end

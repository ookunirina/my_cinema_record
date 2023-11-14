class Movierecord < ApplicationRecord
  belongs_to :user

  has_many :likes, dependent: :destroy
  has_many :users, through: :likes

  has_many :movierecord_tags, dependent: :destroy
  has_many :tags, through: :movierecord_tags

  mount_uploader :image_url, ImageUrlUploader

  validates :title, presence: true, length: { maximum: 100 }
  validates :viewing_style, presence: true
  validates :review, presence: true, length: { maximum: 65_535 }

  def save_with_tags(tag_names:)
    ActiveRecord::Base.transaction do
      tags.clear
      tag_names.each do |name|
        tag = Tag.find_or_create_by(name: name.strip)
        tags << tag
      end
      save!
    end
    true
  rescue StandardError
    false
  end

  def tag_names
    # NOTE: pluckだと新規作成失敗時に値が残らない(返り値がnilになる)
    tags.map(&:name).join(',')
  end
end

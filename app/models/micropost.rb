class Micropost < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: {maximum: 60}
  validates :content, presence: true, length: {maximum: 200}
  validates :user_id, presence: true
  default_scope -> {order(updated_at: :desc)}
  mount_uploader :picture, PictureUploader
  validates :price, presence: true
  validate :picture_size

  private

    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end

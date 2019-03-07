class Micropost < ApplicationRecord
  has_many :favorites, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: {maximum: 60}
  validates :content, presence: true, length: {maximum: 200}
  validates :user_id, presence: true
  default_scope -> {order(updated_at: :desc)}
  validates :price, presence: true
end

class Evaluation < ApplicationRecord
  belongs_to :micropost
  validates :value, presence: true
  validates :buyer_id, presence: true
  validates :micropost_id, presence: true
end

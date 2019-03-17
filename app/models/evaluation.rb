class Evaluation < ApplicationRecord
  belongs_to :micropost
  validates :value, presence: true
  validates :from_id, presence: true
  validates :to_id, presence: true
  validates :micropost_id, presence: true
end

class Room < ApplicationRecord
  belongs_to :micropost, dependent: :destroy
end

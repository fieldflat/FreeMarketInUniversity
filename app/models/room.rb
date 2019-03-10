class Room < ApplicationRecord
  belongs_to :buyer
  belongs_to :micropost
end

class Review < ApplicationRecord
  belongs_to :products


  validates :rating, presence: true



end

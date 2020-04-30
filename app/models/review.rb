class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  # I think it shoul be belongs_to :products

  validates(
    :rating,
    numericality: { greater_than: 0, allow_blank: false },
  )
end
 
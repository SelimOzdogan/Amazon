class Product < ApplicationRecord
  belongs_to :user
  has_many(:reviews, dependent: :destroy)
  has_many(:favorites, dependent: :destroy)


  scope(:search, ->(query) { where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") })

  validates(:title, presence: true, uniqueness: true)
  validates(
    :description,
    presence: { message: "must exist" },
    length: { minimum: 10 },
  )

  before_validation(:set_default_price)
  validates(
    :price,
    numericality: { greater_than: 0, allow_blank: true },
  )
  before_validation(:set_default_hit_count)
  validates(
    :hit_count,
    numericality: { greater_than_or_equal_to: 0, allow_blank: true },
  )

  private

  def set_default_price
    self.price ||= 1
    # self.sale_price = self.price < self.sale_price ? self.price:self.price
  end

  def set_default_hit_count
    self.hit_count ||= 0
    # self.sale_price = self.price < self.sale_price ? self.price:self.price
  end
end

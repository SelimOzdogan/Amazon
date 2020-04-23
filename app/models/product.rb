class Product < ApplicationRecord

  scope(:search, ->(query) { where("title ILIKE ? OR body ILIKE ?", "%#{query}%", "%#{query}%") })

  validates(:title, presence: true, uniqueness: true)
  validates(
    :body,
    presence: { message: "must exist" },
    length: { minimum: 10 },
  )

  validates(
    :price,
    numericality: { greater_than: 0, allow_blank: true },
  )

  before_validation(:set_default_price)

  private

  def set_default_price
    self.price ||= 1
    self.sale_price = self.price < self.sale_price ? self.price:self.price
  end

end

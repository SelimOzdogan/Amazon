class User < ApplicationRecord
  has_secure_password

  has_many :products
  has_many :reviews
  has_many(:likes, dependent: :destroy)
  has_many(:favorites, dependent: :destroy)

  validates(:email, presence: true, uniqueness: true)


  def full_name
    "#{first_name} #{last_name}"
  end
end

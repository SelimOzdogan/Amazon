require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe "#validates" do
    it "is requires a title" do
      # Given
      product = FactoryBot.build(:product, title: nil)
      # Your Factories should always create a valid model
      # FactoryBot.build create a new instance of the model but not save it to the database.

      # When
      product.valid?

      # Then
      # expect is is passed a value we're asserting
      # we can chain .to()
      # .to() accepts a assertion/expectation clause
      expect(product.errors.messages).to(have_key(:title))
    end

end

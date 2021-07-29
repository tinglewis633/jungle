require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before (:each) do
      @category = Category.new name: "New Category"
      @new_product = Product.new(name: "product", price_cents: 1000, quantity: 20, category: @category)
    end

    it "successfully saved" do
      @new_product.save
      expect(@new_product).to be_valid
    end

    it "has error for nil name" do
      @new_product[:name] = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Name can't be blank")
    end

    it "has error for nil price" do
      @new_product[:price_cents] = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Price is not a number")
    end

    it "has error for nil quantity" do
      @new_product[:quantity] = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "has error for nil category" do
      @new_product.category = nil
      expect(@new_product).to_not be_valid
      expect(@new_product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do 

   # SETUP
  before :each do
    @category = Category.create! name: 'HIHI'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "see product details" do
    # ACT
    visit root_path
    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content 'HIHI'
  end
end
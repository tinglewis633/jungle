require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

    # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end


  end

  scenario "my cart change" do

     # ACT
    visit root_path

    find("button.btn-primary").click
    sleep 10

    
    expect(page).to have_content('My Cart (1)')
  end

end
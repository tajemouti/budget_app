require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  it 'renders the form for creating a new category' do
    assign(:category, Category.new)

    render

    expect(rendered).to have_selector('.container') do
      expect(rendered).to have_selector('form[action="/categories"][method="post"]') do
        expect(rendered).to have_selector('label[for="category_name"]', text: 'Name')
        expect(rendered).to have_selector('input#category_name.field[type="text"][placeholder="Category name"]')

        expect(rendered).to have_selector('label[for="category_icon"]', text: 'Icon')
        expect(rendered).to have_selector('input#category_icon.field[type="text"][placeholder="Icon link"]')
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before do
    assign(:categories, create_list(:category, 3))
    render
  end

  it 'displays the page title' do
    expect(rendered).to have_selector('h1', text: 'CATEGORIES')
  end

  it 'displays "ADD A NEW CATEGORY" link' do
    expect(rendered).to have_link('ADD A NEW CATEGORY', href: new_category_path)
  end
end

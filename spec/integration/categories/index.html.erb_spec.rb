require 'rails_helper'

RSpec.describe 'categories/index', type: :view do
  before do
    assign(:categories, create_list(:category, 3))
    render
  end

  it 'displays the page title' do
    expect(rendered).to have_selector('h1', text: 'Categories')
  end

  it 'displays "Add new category" link' do
    expect(rendered).to have_link('Add new category', href: new_category_path)
  end
end

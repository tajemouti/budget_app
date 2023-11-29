require 'rails_helper'

RSpec.describe 'categories/show.html.erb', type: :view do
  let(:user) { create(:user) }
  let(:category) { create(:category, author: user) }
  let(:payments) { create_list(:payment, 2, amount: 10, categories: [category]) }

  before do
    assign(:category, category)
    assign(:payments, payments)
    assign(:sum, payments.sum(&:amount))
    render
  end

  it 'renders the category details and payments' do
    expect(rendered).to have_selector('.back a', text: '<')
    expect(rendered).to have_selector('.list h3', text: category.name)
    expect(rendered).to have_selector('.list p', text: "$#{@sum}")
  end
end

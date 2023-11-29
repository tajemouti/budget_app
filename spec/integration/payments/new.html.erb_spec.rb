require 'rails_helper'

RSpec.describe 'payments/new', type: :view do
  before do
    assign(:category, create(:category, name: 'TestCategory'))
    assign(:payment, build(:payment))
    user = assign(:user, create(:user))
    allow(view).to receive(:current_user).and_return(user)

    render
  end

  it 'renders the new payment form' do
    expect(rendered).to have_selector('form') do
      expect(rendered).to have_selector('label', text: 'Name')
      expect(rendered).to have_selector('input[type="text"][name="payment[name]"]')

      expect(rendered).to have_selector('label', text: 'Amount')
      expect(rendered).to have_selector('input[type="number"][name="payment[amount]"]')

      expect(rendered).to have_selector('label', text: 'Categories')
      expect(rendered).to have_selector('select[name="payment[category_ids][]"]')

      expect(rendered).to have_selector('input[type="submit"][value="ADD TRANSACTION"]')
    end
  end
end

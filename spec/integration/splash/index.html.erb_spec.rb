require 'rails_helper'

RSpec.describe 'splash/index', type: :view do
  it 'displays the Budget Wizard home page' do
    render

    expect(rendered).to have_selector('h1', text: 'Budget Wizard')

    expect(rendered).to have_selector('div') do
      expect(rendered).to have_selector('div', text: 'Sign in') do
        expect(rendered).to have_selector("a[href=\"#{new_user_session_path}\"]")
      end

      expect(rendered).to have_selector('div', text: 'Sign up') do
        expect(rendered).to have_selector("a[href=\"#{new_user_registration_path}\"]")
      end
    end
  end
end

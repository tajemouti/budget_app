require 'rails_helper'

RSpec.describe 'Payments', type: :request do
  describe 'GET /payments/new' do
    it 'returns a successful response' do
      user = create_user
      sign_in user
      category = create(:category, author: user)

      get new_category_payment_path(category)
      expect(response).to be_successful
    end

    it 'assigns a new payment to @payment' do
      user = create_user
      sign_in user
      category = create(:category, author: user)

      get new_category_payment_path(category)
      expect(assigns(:payment)).to be_a_new(Payment)
    end
  end

  describe 'POST /payments' do
    it 'creates a new payment with valid params' do
      user = create_user
      sign_in user
      category = create(:category, author: user)
      payment_params = { name: 'New Payment', amount: 50 }

      expect do
        post category_payments_path(category), params: { payment: payment_params }
      end.to change(Payment, :count).by(1)

      expect(response).to redirect_to(category_path(category))
      follow_redirect!
      expect(response.body).to include('Transaction successfully created.')
    end

    it 'renders new with unprocessable_entity for invalid params' do
      user = create_user
      sign_in user
      category = create(:category, author: user)
      invalid_params = { name: '', amount: '' }

      post category_payments_path(category), params: { payment: invalid_params }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  def create_user
    User.create(name: 'John', email: 'john@gmail.com', password: 'password')
  end
end

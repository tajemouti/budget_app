require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /categories' do
    it 'returns a successful response' do
      user = create_user
      sign_in user
      get categories_path
      expect(response).to be_successful
    end

    it 'assigns @categories with user categories' do
      user = create_user
      sign_in user
      categories = create_list(:category, 3, author: user)

      get categories_path
      expect(assigns(:categories)).to match_array(categories)
    end
  end

  describe 'GET /categories/new' do
    it 'returns a successful response' do
      user = create_user
      sign_in user

      get new_category_path
      expect(response).to be_successful
    end

    it 'assigns a new category to @category' do
      user = create_user
      sign_in user

      get new_category_path
      expect(assigns(:category)).to be_a_new(Category)
    end
  end

  describe 'POST /categories' do
    it 'creates a new category with valid params' do
      user = create_user
      sign_in user
      category_params = { name: 'New Category', icon: 'https://example.com/icon.png' }

      expect do
        post categories_path, params: { category: category_params }
      end.to change(Category, :count).by(1)

      expect(response).to redirect_to(categories_path)
      follow_redirect!
      expect(response.body).to include('Category successfully created.')
    end

    it 'renders new with unprocessable_entity for invalid params' do
      user = create_user
      sign_in user
      invalid_params = { name: '', icon: '' }

      post categories_path, params: { category: invalid_params }

      expect(response).to have_http_status(:unprocessable_entity)
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /categories/:id' do
    it 'returns a successful response' do
      user = create_user
      sign_in user
      category = create(:category, author: user)

      get category_path(category)
      expect(response).to be_successful
    end

    it 'assigns the correct @category, @payments, and @sum' do
      user = create_user
      sign_in user
      category = create(:category, author: user)
      payments = create_list(:payment, 3, categories: [category])

      get category_path(category)
      expect(assigns(:category)).to eq(category)
      expect(assigns(:payments)).to match_array(payments)
      expect(assigns(:sum)).to eq(payments.sum(&:amount))
    end
  end

  def create_user
    User.create(name: 'John', email: 'john@gmail.com', password: 'password')
  end
end

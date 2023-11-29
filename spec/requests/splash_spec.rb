require 'rails_helper'

RSpec.describe SplashController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'skips authentication before action' do
      expect(controller).to receive(:authenticate_user!).exactly(0).times
      get :index
    end
  end
end

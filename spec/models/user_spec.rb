require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many payments' do
      association = described_class.reflect_on_association(:payments)
      expect(association.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      user = User.new(email: 'john@gmail.com', password: '123456')
      expect(user.valid?).to eq(false)
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'is valid with a name' do
      user = User.new(name: 'John', email: 'john@gmail.com', password: '123456')
      expect(user.valid?).to eq(true)
    end
  end
end

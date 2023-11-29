require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'belongs to an author (User)' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

    it 'has many category_payments' do
      association = described_class.reflect_on_association(:category_payments)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:dependent]).to eq(:destroy)
    end

    it 'has many payments through category_payments' do
      association = described_class.reflect_on_association(:payments)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:category_payments)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      category = Category.new(icon: 'https://example.com/icon.png')
      expect(category.valid?).to eq(false)
      expect(category.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of icon' do
      category = Category.new(name: 'Example Category')
      expect(category.valid?).to eq(false)
      expect(category.errors[:icon]).to include("can't be blank")
    end

    it 'is valid with a name and icon' do
      user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
      category = Category.new(name: 'Example Category', icon: 'https://example.com/icon.png', author: user)
      expect(category.valid?).to eq(true)
    end
  end
end

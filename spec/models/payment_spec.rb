require 'rails_helper'

RSpec.describe Payment, type: :model do
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

    it 'has many categories through category_payments' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:category_payments)
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      payment = Payment.new(amount: 100)
      expect(payment.valid?).to eq(false)
      expect(payment.errors[:name]).to include("can't be blank")
    end

    it 'validates presence of amount' do
      payment = Payment.new(name: 'Rent')
      expect(payment.valid?).to eq(false)
      expect(payment.errors[:amount]).to include("can't be blank")
    end

    it 'is valid with a name and amount' do
      user = User.create(name: 'John', email: 'john@gmail.com', password: '123456')
      payment = Payment.new(name: 'Rent', amount: 100, author: user)
      expect(payment.valid?).to eq(true)
    end
  end
end

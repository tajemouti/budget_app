require 'rails_helper'

RSpec.describe CategoryPayment, type: :model do
  describe 'associations' do
    it 'belongs to a category' do
      association = described_class.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a payment' do
      association = described_class.reflect_on_association(:payment)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end

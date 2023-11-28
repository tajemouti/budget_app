class Payment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_payments, dependent: :destroy
  has_many :categories, through: :category_payments

  validates :name, presence: true
  validates :amount, presence: true
end

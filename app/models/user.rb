class User < ApplicationRecord
  has_many :categories, dependent: :destroy, foreign_key: :author_id
  has_many :payments, dependent: :destroy, foreign_key: :author_id
end

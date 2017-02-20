class Category < ApplicationRecord
  has_many :topics, dependent: :destroy

  validates :title, presence: true, uniqueness: {case_sensitive: false,
                                       message: 'must be unique'}
  validates :description, presence: true, length: {minimum: 10}
end

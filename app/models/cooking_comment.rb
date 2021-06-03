class CookingComment < ApplicationRecord
  belongs_to :user
  belongs_to :cooking

  validates :comment, length: { minimum: 5 }
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1,
  }, presence: true
end

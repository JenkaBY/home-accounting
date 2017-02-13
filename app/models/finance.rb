class Finance < ApplicationRecord
  belongs_to :user
  belongs_to :category
  # validates :amount, numericality: {greater_than_or_equal_to: 0.01}, presence: true
  # validates :category, :description, :action_date, presence: true



end

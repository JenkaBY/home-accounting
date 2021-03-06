class Finance < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :amount, numericality: {greater_than_or_equal_to: 0.01}, presence: true
  validates :category_id, :description, :action_date, presence: true

  scope :income,                              -> { joins(:category).where('categories.type_id': Type::INCOME) }
  scope :expense,                             -> { joins(:category).where('categories.type_id': Type::EXPENSE) }
  scope :from_date,                           -> (date) { where( "finances.action_date >= ?", date) }
  scope :to_date,                             -> (date) { where( "finances.action_date <= ?", date) }
  scope :amount,                              -> (amount) { where( "finances.amount = ?", amount)}
  scope :description_or_category_title_like,  -> (keywords) { joins(:category)
                                               .where( "LOWER(finances.description) LIKE ? OR LOWER(categories.title) LIKE ?" ,
                                                       "%#{keywords}%","%#{keywords}%") }

  scope :total,                               -> { sum(:amount) }
  scope :group_by_category_sum_amount,        -> { group(:category_id)
                                                      .select('finances.category_id, sum(finances.amount) as amount') }

 end
class Type < ApplicationRecord
  has_one :category
  EXPENSE = 1
  INCOME = 2

end

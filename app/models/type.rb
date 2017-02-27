class Type < ApplicationRecord
  has_many :categories
  EXPENSE = 1
  INCOME = 2
  before_destroy :ensure_not_referenced_by_any_categories, prepend: true

  def ensure_not_referenced_by_any_categories
    if self.categories.empty?
      return true
    else
      throw :abort
      return false
    end
  end
end
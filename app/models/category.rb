class Category < ApplicationRecord
  belongs_to :user
  has_one :type

  private
  def ensure_not_referenced_by_finance
    if finances.empty?
      return true
    else
      errors.add(:base, 'finances actions exist')
      return false
    end
  end
end

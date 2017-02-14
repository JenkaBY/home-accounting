class Category < ApplicationRecord
  belongs_to :user
  has_one :type
  has_many :finances
  validates :type_id, :title, presence: true

  private

  def ensure_not_referenced_by_finance
    if finances.empty?
      return true
    else
      errors.add(:base, 'finance actions exist')
      return false
    end
  end

end

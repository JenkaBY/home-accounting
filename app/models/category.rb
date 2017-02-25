class Category < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :finances, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_finances, prepend: true

  validates :type_id, :title, presence: true
  scope :categories_with_type, -> ( type_id ) { where(type_id: type_id) }
  scope :income_finances,   -> { where(type_id: Type::INCOME).joins(:finances) }
  scope :expense_finances,  -> { where(type_id: Type::EXPENSE).joins(:finances) }

  private

  def ensure_not_referenced_by_any_finances
    if finances.empty?
      return true
    else
      # errors[:base] << "Can't be destroy because of finance actions exist"
      throw :abort
      return false
    end
  end

end

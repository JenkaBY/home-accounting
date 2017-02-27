class Category < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many :finances, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_finances, prepend: true
  validates :type_id, :title, presence: true

  scope :categories_with_type, -> ( type_id ) { where(type_id: type_id) }

  private

  def ensure_not_referenced_by_any_finances
    if finances.empty?
      return true
    else
      throw :abort
      return false
    end
  end

end
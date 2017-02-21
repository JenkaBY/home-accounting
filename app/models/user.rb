class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories, dependent: :destroy
  has_many :finances, dependent: :destroy
  before_destroy :destroy_finances_first, prepend: true

  def balance
    finances.income.total - finances.expense.total
  end

  private

  def destroy_finances_first
    self.finances.destroy_all
  end

end

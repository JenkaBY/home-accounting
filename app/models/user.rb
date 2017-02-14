class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :categories, dependent: :destroy
  has_many :finances, dependent: :destroy

  scope :income, -> { where(type_id: Type::INCOME).joins(:finances).sum(:amount) }
  scope :expense, -> { where(type_id: Type::EXPENSE).joins(:finances).sum(:amount) }

  def balance
    amount(Type::INCOME) - amount(Type::EXPENSE)
  end


  def amount(type)
    self.categories.where(type_id: type).joins(:finances).sum(:amount)
  end

end

module FinancesHelper

  def get_sign(category)
    category.type_id == Type::EXPENSE ? '-':'+'
  end

  def get_category(id)
    @cata = Category.find(id)
  end


end

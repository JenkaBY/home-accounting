module FinancesHelper

  def get_sign(category)
    category.type_id == Type::EXPENSE ? '-':'+'
  end

  def get_category(id)
    @cata = current_user.categories.find_by(id: id)
  end


end

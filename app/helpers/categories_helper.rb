module CategoriesHelper

  def get_user_categories
    current_user.categories.all.collect { |cat| [cat.title, cat.id] }
  end

  def get_all_types
    Type.all.collect { |cat| [cat.title, cat.id] }
  end

end

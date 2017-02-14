module CategoriesHelper

  def get_categories
    current_user.categories.all.collect { |cat| [cat.title, cat.id] }
  end

  def get_types
    Type.all.collect { |cat| [cat.title, cat.id] }
  end

end

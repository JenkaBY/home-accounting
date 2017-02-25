module CategoriesHelper

  def get_user_categories
    current_user.categories.all.collect { |cat| [cat.title, cat.id] }
  end

  def get_all_types
    Type.all.collect { |type| [type.title, type.id] }
  end


  def get_user_category_types(user)
    user.categories.joins('INNER JOIN types ON categories.type_id = types.id')
        .select('types.title, categories.type_id')
        .group('categories.type_id').group('types.title').collect { |cat| [cat.type_id, cat.title] }
        # .group(:type_id).collect { |cat| [cat.type_id, cat.title] } this works on sqlite3 and doesn't work on PostrgeSQL
  end

  def get_categories_grouped_by_type(user)
    types = get_user_category_types(user)
    grouped_categories_by_type = []
    # [ ['type_title', ['cat_title', 'cat_id'] ], ... ]

    if types
      types.each do |type|
        one_group = []
        type_id = type[0]
        type_title = type[1]
        one_group.append type_title

        categories = user.categories.categories_with_type(type_id).collect { |cat| [cat.title, cat.id] }
        one_group.append categories

        grouped_categories_by_type.append one_group
      end
    end
    grouped_categories_by_type
  end

  def get_category_id_by_finance_id(id)
    if id != nil
      title = @finance.category_id
      return title
    end
    nil
  end

end
module ProductHelper

  def breadcrumbs_for product
    categories = []
    category = product.category
    while !category.nil? do
      categories << category
      category = category.parent
    end
    categories.reverse
  end

  def category_is_an_ancestor_or_self category, subcategory
    return true if category == subcategory
    return category.ancestors.include?(subcategory)
  end

end

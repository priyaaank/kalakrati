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

end

module Admin::ProductHelper

  def category_breadcrumb_for category
    category.ancestors.map(&:name).append(category.name).join(" > ")
  end

  def image_path_for_product product
    product.images.first
  end

end
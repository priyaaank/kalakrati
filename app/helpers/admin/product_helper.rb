module Admin::ProductHelper

  def category_breadcrumb_for category
    category.ancestors.map(&:name).append(category.name).join(" > ")
  end

  def image_path_for_product product
    image = product.images.first
    asset_path(image)
  end

end
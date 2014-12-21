class ProductsPresenter

  def initialize(category_id = nil, page = 0, records_per_page = 4)
    @category_id = category_id
    @page = page
    @records_per_page = records_per_page
  end

  def filtered_products
    offset = @page * @records_per_page
    @category_id.present? ? products_filtered_by_category(offset, @records_per_page) : all_products_filtered(offset, @records_per_page)
  end

  def next_product_list_page
    total_number_of_pages = (filtered_products.count.to_f / @records_per_page).ceil
    @page < total_number_of_pages-1 ? @page+1 : -1
  end

  def category_root
    @category_id.nil? ? nil : category.root
  end

  def category
    Category.where(_id: @category_id).first
  end

  private

  def products_filtered_by_category(offset, limit)
    category = Category.where(:_id => @category_id).first
    (all_products_filtered and return )if category.nil?
    categories = category.descendants.collect(&:id)
    categories << category.id
    Product.in(category: categories).skip(offset).limit(limit)
  end

  def all_products_filtered(offset, limit)
    Product.skip(offset).limit(limit)
  end

end
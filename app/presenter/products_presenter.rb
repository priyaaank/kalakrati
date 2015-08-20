class ProductsPresenter

  attr_accessor :records_per_page, :page

  def initialize(category_id = nil, page = 0, records_per_page = 8)
    @category_id = category_id
    @page = (page.is_a? Numeric) ? page : page.to_i
    @records_per_page = records_per_page
  end

  def filtered_products
    offset = @page * @records_per_page
    @category_id.present? ? products_filtered_and_paginated(offset, @records_per_page) : all_products_filtered_and_paginated(offset, @records_per_page)
  end

  def total_products_count
    @category_id.present? ? products_filtered_by_category.count : all_products_filtered_and_paginated.count
  end

  def total_pages
    (total_products_count.to_f / @records_per_page).ceil
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

  def products_filtered_and_paginated(offset, limit)
    products_filtered_by_category.skip(offset).limit(limit)
  end

  def products_filtered_by_category
    category = Category.where(:_id => @category_id).first
    (all_products_filtered and return )if category.nil?
    categories = category.descendants.collect(&:id)
    categories << category.id
    Product.in(category: categories)
  end

  def all_products_filtered_and_paginated(offset, limit)
    all_products_filtered.skip(offset).limit(limit)
  end

  def all_products_filtered
    Product.newest_first
  end

end

class Admin::ProductsController < Admin::AdminController


  def manage
    @products = Product.all
    render :manage
  end

  def edit
    @product = Product.where(id: params[:id]).first
  end

  def update
    product_id = params[:id]
    product = Product.where(id: product_id).first
    product.update_attributes(product_params)
    @products = Product.all
    render :manage
  end

  private

  def product_params
    params.require(:product).permit!
  end

end
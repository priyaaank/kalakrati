class Admin::ProductsController < Admin::AdminController


  def manage
    @products = Product.all
    render :manage
  end

  def edit
    @product = Product.where(id: params[:id]).first
  end

  def update

  end

end
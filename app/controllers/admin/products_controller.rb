class Admin::ProductsController < Admin::AdminController

  def manage
    @products = Product.all
    render :manage
  end

  def new
    @product = Product.new(:price => Price.new)
  end

  def create
    @product = Product.new(product_params)
    @product.save!
    save_images(@product, params[:product][:image])
    redirect_to action: 'manage'
  end

  def edit
    @product = Product.where(id: params[:id]).first
  end

  def update
    product_id = params[:id]
    product = Product.where(id: product_id).first

    save_images(product, params[:product][:image])

    product.update_attributes(product_params)
    @products = Product.all
    redirect_to action: 'manage'
  end

  private

  def product_params
    params.require(:product).except!(:image).permit!
  end

  def save_images product, images_data
    image_paths = Array.wrap(images_data)
    image_metadata = image_paths.collect { |path| Cloudinary::Uploader.upload(path) } if image_paths.present?
    product.update_images(image_metadata)
  end

end
class Admin::ProductsController < Admin::AdminController

  def manage
    @products = Product.all
    render :manage
  end

  def new
    @product = Product.new(:price => Price.new)
  end

  def create
    image_data =  params[:product][:image]
    @product = Product.new(product_params)
    if image_data.nil? || !@product.valid?
      flash.now[:error] = "All fields are required with at least one image for product specified."
      render :new and return
    end
    @product.save!
    save_images(@product, image_data)
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

  def delete_image
    @product = Product.where(id: params[:id]).first
    if @product.images.size > 1
      image_id = params[:image_id]
      image_to_delete = @product.images.select { |img| img.public_id == image_id }.first
      image_to_delete.delete
      Cloudinary::Uploader.destroy(image_id)
    else
      flash[:error] = "Add another image before you delete the last remaining one. At least one image is required"
    end
    redirect_to admin_product_edit_path(@product.id)
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
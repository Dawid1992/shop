class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path, notice: 'Pomyślnie dodano produkt.'
    else
      render action: :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path, notice: 'Pomyślnie zedytowano produkt.'
    else
      render action: :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :category_id,
      :description,
      :long_description,
      :price,
      :photo
    )
  end

end

class Admin::CategoriesController < Admin::BaseController
  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Pomyślnie dodano kategorię.'
    else
      render action: :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Pomyślnie zedytowano produkt.'
    else
      render action: :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end

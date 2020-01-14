class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)

    if @product.save
      redirect_to @product
    else
      flash[:notice] = 'Товар не был создан'
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      flash[:notice] = 'Товар не может быть обновлен'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy!
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :body, :category_id)
  end
end

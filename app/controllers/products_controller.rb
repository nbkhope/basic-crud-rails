class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    # Get information from the form
    @product = Product.new(product_params)

    if @product.save
      # Successfully saved the product, so go to the product page
      redirect_to @product
    else
      # Failed to save
      render 'new'
    end
  end

  def update
    @product = Product.find(params[:id])

    # Update the product using information from the form
    if @product.update(product_params)
      redirect_to @product
    else
      # Failed to save
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
 
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end

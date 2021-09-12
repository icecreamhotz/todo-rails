class ProductsController < ApplicationController
  def index
    products = Product.all
    api_collection products
  end

  def show
    product = Product.find(params[:id])

    if !product
      not_found
      return
    end

    api_item product
  end

  def create
    product = Product.new(product_params)

    if product.save
      api_created product
    else
      bad_request
    end
  end

  def update
    product = Product.find(params[:id])

    if !product
      not_found
      return
    end

    if product.update(product_params)
      api_updated product
    else
      bad_request
    end
  end

  def destroy
    if product = Product.find(params[:id])
      product.remove_from_list
      product.destroy
      api_deleted
    else
      not_found
    end
  end

  def position
    condition = params[:condition]
    unless ["up", "down"].include?(params[:condition])
      bad_request
      return
    end

    if product = Product.find(params[:id])
      if condition == "up"
        product.move_to_top
      elsif condition == "down"
        product.move_to_bottom
      end
      api_updated product
    else
      not_found
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :image)
  end
end

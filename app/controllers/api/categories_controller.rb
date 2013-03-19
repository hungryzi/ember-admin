class Api::CategoriesController < ApplicationController
  respond_to :json

  def index
    respond_with Category.all
  end

  def create
    category = Category.new(params[:category])

    if category.save
      respond_with category
    else
      respond_with category, status: 422
    end
  end

  def show
    respond_with Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    if category.update_attributes(params[:category])
      respond_with category
    else
      respond_with category, status: 422
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      respond_with category, status: 204
    else
      respond_with category
    end
  end
end


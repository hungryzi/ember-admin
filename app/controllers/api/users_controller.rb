class Api::UsersController < ApplicationController
  respond_to :json

  def index
    respond_with User.all
  end

  def create
    user = User.new(params[:user])

    if user.save
      respond_with user
    else
      respond_with user, status: 422
    end
  end

  def show
    respond_with User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      respond_with user
    else
      respond_with user, status: 422
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      respond_with user, status: 204
    else
      respond_with user
    end
  end
end


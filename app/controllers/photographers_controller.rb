class PhotographersController < ApplicationController
  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user = current_user

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def photographer_params
    params.require(:photographer).permit(:camera, :lenses, :profession, :phone_number)
  end

end

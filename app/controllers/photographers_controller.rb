class PhotographersController < ApplicationController
  before_action :set_photographer, only: [:edit, :update, :destroy]

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user = current_user
    if @photographer.save
      params[:photographer][:photographerspecialty_ids].reject(&:blank?).each do |specialty|
        Photographerspecialty.create(photographer: @photographer, specialty_id: specialty)
      end
      redirect_to dashboard_path(@photographer)
    else
      render 'new'
    end
   end

  def edit
    redirect_to edit_user_registration_path
  end

  def update
    @photographer.update(photographer_params)
      if @photographer.save
      redirect_to dashboard_path
      else
      render 'edit'
    end
  end

  def destroy
    @photographer.destroy
    redirect_to root_path
  end

  private

   def set_photographer
      @photographer = Photographer.find(current_user.photographer.id)
   end

  def photographer_params
    params.require(:photographer).permit(:camera, :lenses, :profession, :phone_number)
  end
end

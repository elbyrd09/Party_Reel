class PhotographersController < ApplicationController
  before_action :set_attendee, only: [:edit, :update, :destroy]

  def new
    @photographer = Photographer.new
  end

  def create
    @photographer = Photographer.new(photographer_params)
    @photographer.user = current_user
    raise
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
  end

  def update
  end

  def destroy
  end

  private

   def set_photographer
    @photographer = Photographer.find(params[:id])
   end

  def photographer_params
    params.require(:photographer).permit(:camera, :lenses, :profession, :phone_number)
  end
end

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
    # it is not possible for a photographer to upload an amount of portfoliophotos that would bring the total amount to higher than 10
    if check_portfoliophotos_amount
      redirect_to dashboard_path, alert: "You can not have more than 10 photos in your portfolio"
      return
    end
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

  def delete_pfphoto_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to dashboard_path
  end

  private

  def check_portfoliophotos_amount
    (params["photographer"]["portfoliophotos"].count + @photographer.portfoliophotos.count) > 10
  end

  def set_photographer
    @photographer = Photographer.find(current_user.photographer.id)
  end

  def photographer_params
    params.require(:photographer).permit(:camera, :lenses, :profession, :phone_number, portfoliophotos: [])
  end
end

class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
  end
  
  def new

  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "Make sure all fields are filled in!"
      render :new
    end
  end

  private
    def application_params
      params[:address] = params[:street_address] + params[:city] + params[:state] + params[:zip]
      params.permit(:name, :description, :address, :status)
    end
end
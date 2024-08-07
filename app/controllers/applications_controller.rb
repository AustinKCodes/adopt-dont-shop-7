class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    if params[:search]
      @pet_search = Pet.where(name: params[:search])
    end
  end
  
  def new

  end

  def update
    @application = Application.update(description: params[:application][:description], status: params[:application][:status])
    redirect_to "/applications/#{params[:id]}"
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
class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:id])
    @pet = Pet.find(params[:id])
  end
  
end
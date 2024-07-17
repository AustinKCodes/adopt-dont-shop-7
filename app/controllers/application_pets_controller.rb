class ApplicationPetsController < ActionController::Base
  def create
    ApplicationPet.create(application_id: params[:application_id], pet_id: params[:pet_id])
    redirect_to "/applications/#{params[:application_id]}"
  end
  
# i dont understand this
  def application_pets_params
    params.permit(:application_id, :pet_id)
  end
end
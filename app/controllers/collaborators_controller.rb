class CollaboratorsController < ApplicationController
  
  def create
    # binding.pry
    @collaborator = Collaborator.new(collaborator_params)
    
    if @collaborator.save
      flash[:notice] = "Collaborator has been successfully added.Yay!"
      redirect_to Wiki.find_by(params[:collaborator][:wiki])
    else
      flash.now[:alert] = "Bummer!There was an error adding the collaborator:( .Please try again."
      redirect_to Wiki.find_by(params[:collaborator][:wiki])
    end  
  end

  def destroy
  end
  
  private
  
  def collaborator_params
    params.require(:collaborator).permit(:wiki_id, :user_id)
  end
end

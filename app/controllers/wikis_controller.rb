class WikisController < ApplicationController
  
  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user_id = params[:wiki][:user]||= current_user.id
    
   
    if @wiki.save
      flash[:notice] = "Your wiki has been successfully created.Yay!"
      redirect_to @wiki
    else
      flash.now[:alert] = "Bummer!There was an error creating the wiki :( .Please try again."
      render :new
    end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    
    @wiki.assign_attributes(wiki_params) 
    
    if @wiki.save
      flash[notice] = "Wiki has been successfully updated!"
      redirect_to [@wiki]
    else
      flash.now[:alert] = "Bummer!There was an error trying to save the wiki changes..Please try again later"
      render :edit
    end
  end  
  
  def destroy
    @wiki = Wiki.find(params[:id])
 
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "Bummer!There was an error deleting the wiki.Please try again later"
      render :show
    end
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
  
  
  
end

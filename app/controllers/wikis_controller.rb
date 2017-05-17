class WikisController < ApplicationController
  
  before_action :require_login
  
  def index
    @wikis = policy_scope(Wiki)
  end
  
  def public_wikis
    @wikis = Wiki.all
  end
    

  def show
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    
    authorize @wiki
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
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    
    authorize @wiki
    @wiki.assign_attributes(wiki_params) 
    
    if @wiki.save
      flash[notice] = "Wiki has been successfully updated!"
      redirect_to [@wiki]
    else
      flash.now[:alert] = "Bummer!There was an error trying to save the wiki changes.Please try again later"
      render :edit
    end
  end  
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    authorize @wiki
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
    params.require(:wiki).permit(:title, :body, :private)
  end
  
end

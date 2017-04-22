class WikisController < ApplicationController
  def index
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user_id = params[:wiki][:user]
    
    if @wiki.save
      flash[:notice] = "Your wiki has been successfully created.Yay!"
      redirect_to @wiki
    else
      flash.now[:alert] = "Bummer!There was an error creating the wiki. Please try again."
      render :new
    end
  end

  def edit
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end
  
  
  
end

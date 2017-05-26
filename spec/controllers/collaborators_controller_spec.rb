require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do
  
  before(:each) do
    @my_user = FactoryGirl.create(:user)
    sign_in @my_user
    @my_wiki = FactoryGirl.create(:wiki, user: @my_user)
    @my_collaborator = FactoryGirl.create(:user)
  end 
  
  describe "POST create" do
    it "increases the number of Collaborators by 1" do
      expect{ post :create, collaborator: { wiki: @my_wiki, user: @my_collaborator } }.to change(Collaborator, :count).by(1)
    end

    it "assigns the new collaborator to @collaborator" do
      post :create, collaborator: { wiki: @my_wiki, user: @my_collaborator }
      expect(assigns(:collaborator)).to eq Collaborator.last
    end

    it "redirects to the wiki" do
      post :create, collaborator: { wiki: @my_wiki, user: @my_collaborator }
      expect(response).to redirect_to Wiki.last
    end
  end
  
end
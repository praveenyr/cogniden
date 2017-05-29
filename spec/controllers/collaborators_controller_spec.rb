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
      expect{ post :create, collaborator: { wiki_id: @my_wiki.id, user_id: @my_collaborator.id } }.to change(Collaborator, :count).by(1)
    end

    it "assigns the new collaborator to @collaborator" do
      post :create, collaborator: { wiki_id: @my_wiki.id, user_id: @my_collaborator.id }
      expect(assigns(:collaborator)).to eq Collaborator.last
    end

    it "redirects to the wiki" do
      post :create, collaborator: { wiki_id: @my_wiki.id, user_id: @my_collaborator.id }
      expect(response).to redirect_to Wiki.last
    end
  end
  
  describe "DELETE destroy" do
    it "deletes the collaborator" do
      post :create, collaborator: { wiki_id: @my_wiki.id, user_id: @my_collaborator.id }
      collaborator_instance = assigns(:collaborator)
      delete :destroy, id: collaborator_instance.id
      count = Collaborator.where({id: collaborator_instance.id}).size
      expect(count).to eq 0
    end

    it "redirects to Wiki" do
      post :create, collaborator: { wiki_id: @my_wiki.id, user_id: @my_collaborator.id }
      collaborator_instance = assigns(:collaborator)
      delete :destroy, id: collaborator_instance.id
      expect(response).to redirect_to collaborator_instance.wiki
    end
  end
  
end
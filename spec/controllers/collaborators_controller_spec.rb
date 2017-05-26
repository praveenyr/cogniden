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
  
end
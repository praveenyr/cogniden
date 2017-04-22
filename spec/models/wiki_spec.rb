require 'rails_helper'

RSpec.describe Wiki, type: :model do
  let(:my_user) { User.create!(email: "praveenyr@gmail.com", password: "password") }
  let(:my_wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: my_user) }
 

  describe "attributes" do
    it "has title and body attributes" do
      expect(my_wiki).to have_attributes(title: "New Wiki Title", body: "New Wiki Body")
    end
  end
  
end






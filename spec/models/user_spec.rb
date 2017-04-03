require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!( email: "praveenyr@gmail.com", password: "praveen") }
   
  describe "attributes" do
    it "should have email and password attributes" do
      expect(user).to have_attributes(email: user.email, password: user.password)
    end
  end
   
  describe "invalid user" do
    let(:user_with_duplicate_email) { User.create!( email: "praveenyr@gmail.com", password: "sadsadsad") }
    let(:user_with_invalid_email) { User.create!( email: "", password: "sggfhjgfhfhg") }
 
    it "should be an invalid user due to duplicate email" do
      expect(user_with_duplicate_email).to_not be_valid
    end
 
    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end   
end

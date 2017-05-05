require 'rails_helper'

describe WikiPolicy, type: :policy do
  subject { WikiPolicy }

  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:wiki) { create(:wiki, user: admin) }

  context 'being a member' do
    permissions :update? do
      it "should allow a user to update" do
        expect(subject).not_to permit(user, wiki)
    	end
    end

    permissions :edit? do
      it "should not allow a user to edit" do
        expect(subject).not_to permit(user, wiki)
    	end
    end

    permissions :show? do
      it "should allow a user to see a wiki" do
        expect(subject).to permit(user, wiki)
    	end
    end

    permissions :destroy? do
      it "should not allow a user to destroy a wiki" do
        expect(subject).not_to permit(user, wiki)
      end
    end
  end

  context 'being an admin' do
    permissions :update? do
      it "should allow an admin to update" do
        expect(subject).to permit(admin, wiki)
      end
    end

    permissions :edit? do
      it "should allow an admin to edit" do
        expect(subject).to permit(admin, wiki)
      end
    end

    permissions :show? do
      it "should allow an admin to see a wiki" do
        expect(subject).to permit(admin, wiki)
      end
    end

    permissions :destroy? do
      it "should allow an admin to destroy a wiki" do
        expect(subject).to permit(admin, wiki)
      end
    end
  end
end

require 'rails_helper'

describe WikiPolicy do
  subject { described_class.new(user, wiki) }
  
  let(:user) { User.create!(email: "praveenyr@gmail.com", password: "password", confirmed_at: '2016-08-14') }
  let(:wiki) { Wiki.create!(title: "New Wiki Title", body: "New Wiki Body", user: user) }
  
  context 'being a member' do
    user.add_role :member
    it { is_expected.to permit_actions([:show, :create]) }
  end

  context 'being an administrator' do
    user.add_role :admin
    it { is_expected.to permit_actions([:show, :create, :destroy]) }
  end
end
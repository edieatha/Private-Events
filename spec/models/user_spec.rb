require 'rails_helper'
RSpec.describe User, type: :model do
  context 'Has' do
    let(:user) { User.create(email: 'tested@test.com', password: 'testing') }
    let(:dup_user) { user.dup }

    it 'VALID Email!' do
      expect(user.email).to match(/\A[\w+\-.]+@[a-z\d\-]+\.[a-z]+\z/)
    end

    it 'INVALID Email!' do
      expect(user.email).not_to match(/\A[\w+\-.]+[a-z\d\-]+\.[a-z]+\z/)
    end

    it 'EMPTY Email!' do
      user.email = ''
      expect(user).not_to be_valid
    end
  end

  context 'Assocs test for User/event' do
    it { should have_many(:attended_events) }
    it { should have_many(:created_events) }
    it { should have_many(:events) }
  end
end

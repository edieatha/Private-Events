require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Validation for Event model'
  let(:user) { User.new(email: 'user@test.com', password: 'testing') }
  let(:event) { Event.new(even_name: 'event name', location: 'location', description: 'description', date: '19-04-2020', creator_id: user.id) }

  it 'VALID if with event name' do
    expect(event).to be_valid
  end

  it 'NOT VALID without event name' do
    event.even_name = ''
    expect(event).not_to be_valid
  end

  context 'Assocs test for event/user models' do
    it { should have_many(:attendees) }
    it { should have_many(:invitations) }
    it { should belong_to(:creator) }
  end
end

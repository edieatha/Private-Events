require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'Has'
  let(:user) { User.create(id: 999, email: 'user@test.com', password: 'testing', created_at: DateTime.now, updated_at: DateTime.now + 1.week) }
  let(:event) { Event.new(even_name: 'event name', location: 'location', description: 'description', date: '14-04-2020', creator_id: user.id) }

  it 'VALID event name' do
    expect(event.even_name).not_to be_empty
  end

  it 'VALID description' do
    expect(event.description).not_to be_empty
  end

  it 'VALID location' do
    expect(event.location).not_to be_empty
  end

  it 'VALID date' do
    expect(event.location).not_to be_empty
  end

  context 'Assocs test for event/user models' do
    it { should have_many(:attendees) }
    it { should have_many(:invitations) }
    it { should belong_to(:creator) }
  end
end

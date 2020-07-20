require 'rails_helper'
RSpec.describe Invitation, type: :model do
  context 'Assocs test for Attended_event belongs_to' do
    it { should belong_to(:attended_event) }
    it { should belong_to(:attendee) }
  end
end

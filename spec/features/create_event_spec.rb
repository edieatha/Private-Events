require 'rails_helper'
RSpec.describe 'Creat', type: :feature do
  let(:user) { User.create(id: 999, email: 'user@test.com', password: 'testing', created_at: DateTime.now, updated_at: DateTime.now + 1.week) }
  let(:event) { Event.create(even_name: 'event name', location: 'location', description: 'description', date: '2020-04-19', creator_id: user.id) }
  scenario 'Valid event!' do
    visit new_user_session_path
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit new_event_path
    fill_in placeholder: 'Event Name', with: 'event'
    fill_in 'Description', with: 'testing'
    fill_in 'Location', with: 'testing'
    fill_in 'Date', with: DateTime.now
    click_on class: 'btn-block'
    expect(page).to have_current_path(events_path)
  end

  scenario 'Invalid event!' do
    visit new_user_session_path
    fill_in 'Email address', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    visit new_event_path
    fill_in placeholder: 'Event Name', with: ''
    fill_in 'Description', with: ''
    fill_in 'Location', with: ''
    fill_in 'Date', with: DateTime.now
    click_on class: 'btn-block'
    expect(page).to have_content('Create New Event')
  end
end

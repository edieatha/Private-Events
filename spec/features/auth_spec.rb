require 'rails_helper'
RSpec.describe 'Only Authenticated', type: :feature do
  let(:user) { User.create(id: 999, email: 'user@test.com', password: 'testing', created_at: DateTime.now, updated_at: DateTime.now + 1.week) }
  let(:event) { Event.create(even_name: 'event name', location: 'location', description: 'description', date: '2020-04-19', creator_id: user.id) }

  scenario 'User can sign in!' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_content('Upcoming events')
  end

  scenario 'User can create event!' do
    visit new_event_path
    expect(page).to have_current_path(new_user_session_path)
  end

  scenario 'User can attend event!' do
    visit events_path
    expect(page).not_to have_content('Attend')
  end

  scenario 'A user can attend event!' do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_current_path(root_path)
    expect(page).to have_content('Upcoming events')
  end
end

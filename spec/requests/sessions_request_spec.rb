require 'rails_helper'

require 'capybara/rspec'

RSpec.describe 'login followed by logout', type: :feature do
  let(:user) { User.create(name: 'Morris') }

  scenario 'login page' do
    visit login_path
    fill_in 'session_name', with: user.name
    click_button 'Login'
    sleep(3)
    expect(page).to have_content('All Groups')
    click_on 'LOGOUT', match: :first
    sleep(3)
    expect(page).to have_content('LOG IN')
  end

  scenario 'Invalid User login' do
    visit login_path
    fill_in 'session_name', with: ''
    click_button 'Login'

    expect(page).to have_text('LOGIN')
  end

  context 'fields in login page' do
    it 'name field in login page' do
      visit login_path
      expect(page).to have_content 'Name'
    end
  end
end

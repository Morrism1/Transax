require 'rails_helper'

RSpec.describe "Groups", type: :request do
  let(:user) { User.create(name: 'Mark') }
  it 'creates a new group' do
    visit login_path
    fill_in 'session_name', with: user.name
    click_button 'Login'
    sleep(3)
    expect(current_path).to eql(user_path(id: user.id))

    click_on 'All Groups'
    click_on 'NEW GROUP'
    fill_in 'group[name]', with: 'Sneakers'
    click_button 'Create'

    expect(page).to have_content('Sneakers')
    
  end
end

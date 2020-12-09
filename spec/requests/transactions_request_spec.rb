require 'rails_helper'

RSpec.describe 'Transactions', type: :request do
  let(:user) { User.create(name: 'Mark') }
  it 'creates a new external transaction' do
    visit login_path
    fill_in 'session_name', with: user.name
    click_button 'Login'
    sleep(3)
    expect(current_path).to eql(user_path(id: user.id))

    click_on 'My External Transactions'
    click_on 'NEW TRANSACTION'
    fill_in 'transaction[name]', with: 'Jordan'
    fill_in 'transaction[amount]', with: '300'
    click_button 'Register'

    visit external_path
    expect(page).to have_content('Jordan')
  end
end

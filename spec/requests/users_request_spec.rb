require 'rails_helper'
require 'capybara/rspec'

RSpec.describe UsersController, type: :controller do
  before do
    @user = User.create(name: 'Maurice')
  end
  context 'GET users controller views' do
    it 'GET #show' do
      get :show, params: { id: @user.id }, session: { 'user_id': @user.id }
      expect(response).to be_successful
    end
    it 'GET #new/sign up page' do
      get :new
      expect(response).to be_successful
    end
  end

  context 'Create user' do
    it 'should create a user' do
      @user = User.new(id: '1', name: 'Morris')
      expect(@user.save).to eq(true)
    end
  end
end

RSpec.describe 'Sign up fields', type: :feature do
  let(:user) { User.create(name: 'Maurice') }

  scenario 'create user' do
    visit signup_path
    fill_in 'user_name', with: user.name
    click_button 'Sign Up'
    sleep(3)
    expect(page).to have_content('Name')
  end

  context 'fields in sign up page' do
    it 'name field in signup page' do
      visit signup_path
      expect(page).to have_content 'Name'
    end
  end

  it 'creates a new user' do
    visit 'users/new'
    expect(page).to have_content('SIGNUP')
    fill_in 'user_name', with: user.name
    click_button 'Sign Up'
    expect(page).not_to have_content('Sign Up')
  end

  it "changes a user's details" do
    visit 'users/new'
    fill_in 'user_name', with: 'Magda'
    click_button 'Sign Up'
    expect(page).to have_content('Logged in successful')
  end
end

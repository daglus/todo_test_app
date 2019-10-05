require 'rails_helper'

feature 'home page' do
  scenario 'welcome text on page' do
    visit('/')
    expect(page).to have_content('Welcome to the app!')
  end
end

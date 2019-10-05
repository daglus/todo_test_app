require "rails_helper"

feature 'Dont allow sign up with blank field' do

  scenario 'cannot sign up user if field has be blank' do
    visit('/')
    click_on('Sign Up')

    click_on('Sign Up')
    expect(page).to have_content("can't be blank")
  end
end

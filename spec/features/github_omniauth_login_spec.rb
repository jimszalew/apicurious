require 'rails_helper'

RSpec.feature 'User can login through Github and logout' do
  scenario 'and see their username' do
    stub_omniauth

    visit root_path

    expect(page).to have_link("Login with Github")

    click_link "Login with Github"

    expect(page).to have_content("Jim Szalewski")
    expect(page).to have_link("Logout")
  end
end

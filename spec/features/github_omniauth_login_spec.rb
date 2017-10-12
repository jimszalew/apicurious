require 'rails_helper'

RSpec.feature 'User logs in through Github and can logout' do
  scenario 'and sees their basic info and links' do
    VCR.use_cassette('features/login') do
      stub_omniauth

      visit root_path

      expect(page).to have_link("Login with Github")

      click_link "Login with Github"

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content("jimszalew")
      expect(page).to have_css(".profile_pic")
      expect(page).to have_css(".starred_repos")
      expect(page).to have_css(".followers")
      expect(page).to have_css(".following")
      expect(page).to have_link("Repositories")

      click_link "Logout"

      expect(current_path).to eq(root_path)
    end
  end
end

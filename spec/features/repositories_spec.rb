require 'rails_helper'

RSpec.feature 'Logged in user visits their repositories page' do
  scenario 'and sees a list of their repositories' do
    VCR.use_cassette('features/repositories') do
      stub_omniauth
      visit dashboard_index_path

      # click_link "Repositories"
      page.find(".repository").click

      expect(current_path).to eq(repositories_path)
      expect(page).to have_css('.repository', count: 46)
      within(first('.repository')) do
        expect(page).to have_css('.name')
        expect(page).to have_css('.description')
        expect(page).to have_css('.language')
        expect(page).to have_css('.updated')
      end
    end
  end
end

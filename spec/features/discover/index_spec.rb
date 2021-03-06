require 'rails_helper'

RSpec.describe "Discover Index Page" do
  describe "As a user" do
    before :each do
      @user = User.create!(email: 'email@gmail.com', password: '12345')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "Has a button to the discover page from dashboard" do
      VCR.use_cassette('upcoming movies') do
        visit dashboard_path
        expect(page).to have_button('Discover Movies')
        click_button('Discover Movies')
        expect(current_path).to eq(discover_index_path)
      end
    end

    it "There is button to find to rated movies" do
      VCR.use_cassette('upcoming movies') do
        visit discover_index_path
        find_button('Find Top Rated Movies')
      end
    end

    it "Has a search field and button to search by movie title. Clicking search button redirects to movie show page" do
      VCR.use_cassette('upcoming movies') do

        visit discover_index_path

        within('.search_movie_form') do
          expect(page).to have_selector("input[placeholder='Search movie by title']")
          find_button('Find Movies')
        end
      end
    end
  end
end

require 'rails_helper'

RSpec.describe 'movies show page' do
  describe 'when visiting' do
    before :each do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
      # create actors



    end

    it 'has the movie title, creation year, and genre' do
      visit "/movies/#{@raiders.id}"

      expect(page).to have_content(@raiders.title)
      expect(page).to have_content(@raiders.creation_year)
      expect(page).to have_content(@raiders.genre)
    end

    it 'has a list of its actors from youngest to oldest'
    it 'has the average age of all the actors in the movie'
  end
end

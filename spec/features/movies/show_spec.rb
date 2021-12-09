require 'rails_helper'

RSpec.describe 'movies show page' do
  describe 'when visiting' do
    before :each do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
      # create actors
      @ford = @raiders.actors.create!(name: 'Harrison Ford', age: 78)
      @allen = @raiders.actors.create!(name: 'Karen Allen', age: 70)
      @freeman = @raiders.actors.create!(name: 'Paul Freeman', age: 78)


    end

    it 'has the movie title, creation year, and genre' do
      visit "/movies/#{@raiders.id}"

      expect(page).to have_content(@raiders.title)
      expect(page).to have_content(@raiders.creation_year)
      expect(page).to have_content(@raiders.genre)
    end

    it 'has a list of its actors from youngest to oldest' do
      visit "/movies/#{@raiders.id}"

      expect(page).to have_content(@ford.name)
      expect(page).to have_content(@allen.name)
      expect(page).to have_content(@freeman.name)

      expect(@allen.name).to appear_before(@ford.name)
      expect(@ford.name).to appear_before(@freeman.name)
    end

    it 'has the average age of all the actors in the movie'
  end
end

require 'rails_helper'

RSpec.describe 'create new actors' do
  describe 'from the movie show page' do
    before :each do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

      @ford = @raiders.actors.create!(name: 'Harrison Ford', age: 78)
      @allen = @raiders.actors.create!(name: 'Karen Allen', age: 70)
      @freeman = @raiders.actors.create!(name: 'Paul Freeman', age: 78)
      @davies = Actor.create!(name: 'John Rhys-Davies', age: 77)

      @pixar = Studio.create!(name: 'Pixar Studios', location: 'San Francisco')
      @toy = @pixar.movies.create!(title: 'Toy Story', creation_year: 2004, genre: 'Family')
      @monster = @pixar.movies.create!(title: 'Monster Inc.', creation_year: 2001, genre: 'Comedy')
      @buzz = @toy.actors.create!(name: 'Buzz Lightyear', age: 27)
    end

    it 'has a form that can add and actor and redirects to show page' do
      visit "/movies/#{@raiders.id}"

      expect(page).to have_content(@ford.name)
      expect(page).to_not have_content('John Rhys-Davies')

      fill_in(:name, with: 'John Rhys-Davies')
      fill_in(:age, with: 77)
      click_button "Add Actor"

      expect(current_path).to eq("/movies/#{@raiders.id}")
      expect(page).to have_content('John Rhys-Davies')
    end
  end
end

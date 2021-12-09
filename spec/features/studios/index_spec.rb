require 'rails_helper'

RSpec.describe 'studio index' do
  describe 'when visiting the studio index page' do
    before :each do
      @universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
      @disney = Studio.create!(name: 'Disney Studios', location: 'Los Angeles')
      @pixar = Studio.create!(name: 'Pixar Studios', location: 'San Francisco')
      @raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
      @shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
      @avengers = @disney.movies.create!(title: 'The Avengers', creation_year: 2003, genre: 'Action')
      @aladdin = @disney.movies.create!(title: 'Alladin', creation_year: 1992, genre: 'Comedy')
      @toy = @pixar.movies.create!(title: 'Toy Story', creation_year: 2004, genre: 'Family')
      @monster = @pixar.movies.create!(title: 'Monster Inc.', creation_year: 2001, genre: 'Comedy')
    end

    it "has each studio's name and location" do
      visit '/studios'

      expect(page).to have_content(@universal.name)
      expect(page).to have_content(@universal.location)
      expect(page).to have_content(@disney.name)
      expect(page).to have_content(@disney.location)
      expect(page).to have_content(@pixar.name)
      expect(page).to have_content(@pixar.location)
    end

    it 'underneath each studio it shows their movies' do
      visit '/studios'
save_and_open_page
      within("#studio-#{@universal.id}") do
        expect(page).to have_content(@raiders.title)
        expect(page).to have_content(@shrek.title)
      end

      within("#studio-#{@disney.id}") do
        expect(page).to have_content(@avengers.title)
        expect(page).to have_content(@aladdin.title)
      end

      within("#studio-#{@pixar.id}") do
        expect(page).to have_content(@toy.title)
        expect(page).to have_content(@monster.title)
      end
    end
  end
end

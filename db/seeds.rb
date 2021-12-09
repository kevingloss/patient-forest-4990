@universal = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

@raiders = @universal.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
@shrek = @universal.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

@ford = @raiders.actors.create!(name: 'Harrison Ford', age: 78)
@allen = @raiders.actors.create!(name: 'Karen Allen', age: 70)
@freeman = @raiders.actors.create!(name: 'Paul Freeman', age: 78)

@pixar = Studio.create!(name: 'Pixar Studios', location: 'San Francisco')
@toy = @pixar.movies.create!(title: 'Toy Story', creation_year: 2004, genre: 'Family')
@monster = @pixar.movies.create!(title: 'Monster Inc.', creation_year: 2001, genre: 'Comedy')
@buzz = @toy.actors.create!(name: 'Buzz Lightyear', age: 27)

@disney = Studio.create!(name: 'Disney Studios', location: 'Los Angeles')
@avengers = @disney.movies.create!(title: 'The Avengers', creation_year: 2003, genre: 'Action')
@aladdin = @disney.movies.create!(title: 'Alladin', creation_year: 1992, genre: 'Comedy')

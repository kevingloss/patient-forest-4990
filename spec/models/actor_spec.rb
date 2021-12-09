require 'rails_helper'

RSpec.describe Actor, type: :model do
  describe 'relationships' do
    it { should have_many :actor_movies}
    it { should have_many(:movies).through(:actor_movies) }
  end

  it 'sorts actors by age asc' do
    ford = Actor.create!(name: 'Harrison Ford', age: 78)
    allen = Actor.create!(name: 'Karen Allen', age: 70)
    freeman = Actor.create!(name: 'Paul Freeman', age: 78)

    expect(Actor.by_age_asc).to eq([allen, ford, freeman])
  end

end

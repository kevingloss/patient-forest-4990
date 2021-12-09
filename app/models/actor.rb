class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.by_age_asc
    order(:age)
  end

  def self.avg_age
    average(:age).round(2)
  end
end

class ActorsController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    actor = movie.actors.create(actor_params)
    redirect_to "/movies/#{movie.id}"
  end

  private
  def actor_params
    params.permit(:name, :age)
  end
end

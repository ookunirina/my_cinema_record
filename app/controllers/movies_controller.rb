class MoviesController < ApplicationController

  require 'dotenv/load'
  require 'themoviedb-api'
  
  Tmdb::Api.key(d95117c30490d5092714acfecca3f9b2)
  Tmdb::Api.language("ja")

  def search
  end

  def show
  end
end

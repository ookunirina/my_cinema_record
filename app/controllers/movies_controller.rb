class MoviesController < ApplicationController

  require 'dotenv/load'
  require 'themoviedb-api'
  
  Tmdb::Api.key(ENV["TMDB_API_KEY"])
  Tmdb::Api.language("ja")

  def search
  end

  def show
  end
end

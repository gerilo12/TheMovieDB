class MoviesController < ApplicationController

  def home
  end

  def search
    research = SearchMovie.new(params[:research])
    research.perform
    @results = research.results
  end

end

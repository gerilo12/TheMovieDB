class SearchMovie
  attr_reader :results

  def initialize(research)
    Tmdb::Api.key(Rails.application.credentials[:tmdb_api_key])
    @research = research
    @results = []
  end

  def perform
    @movies = Tmdb::Movie.find(@research)
    @movies.each do |movie|
      crew = Tmdb::Movie.credits(movie.id)["crew"]
      directors = []
      crew.each do |member|
        p member
        directors << member["name"] if member["job"] == "Director"
      end

      @results << { id: movie.id,
                    title: movie.title,
                    director: directors,
                    release_date: movie.release_date,
                    poster: movie.poster_path }
    end
  end

end

# The Movie Database API

[![Build Status](https://travis-ci.org/andrielfn/tmdb-api.png?branch=master)](https://travis-ci.org/andrielfn/tmdb-api)
[![Code Climate](https://codeclimate.com/github/andrielfn/tmdb-api.png)](https://codeclimate.com/github/andrielfn/tmdb-api)

A simple Ruby wrapper for the The Movie Database API v3.

About the TMDb API documentation and everything else you can se here: [http://docs.themoviedb.apiary.io/](http://docs.themoviedb.apiary.io).

## Installation

Add this line to your application's Gemfile:

    gem 'tmdb-api'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install tmdb-api


## API Key
First of all, you need set your API Key provided by TMDb.

```ruby
TMDb.api_key = '56565958363476674e5e63643c787867'
```

Also it's possible set the API in the `TMDB_API_KEY` environment variable:

```
export TMDB_API_KEY='56565958363476674e5e63643c787867'
```

## Usage

### Find a movie by id
Get the basic movie information for a specific movie id.

```ruby
TMDB::Movie.find(24)
# => #<TMDb::Movie:0x007f99 @id=24, @title="Kill Bill: Vol. 1", @imdb_id="tt0266697" ... >

TMDB::Movie.find(603, language: 'pt')
# => #<TMDb::Movie:0x007f99 @id=603, @title="The Matrix", @imdb_id="tt0133093" ... >
```

Available attributes: `id`, `adult`, `backdrop_path`, `belongs_to_collection`,
`budget`, `genres`, `homepage`, `imdb_id`, `original_title`, `overview`,
`popularity`, `poster_path`, `production_companies`, `runtime`,
`production_countries`, `release_date`, `revenue`, `spoken_languages`, `status`,
 `tagline`, `title`, `vote_average`, `vote_count`.

### Search movies
Search for movies by title.

```ruby
TMDb::Movie.search('Forrest')
# => [#<TMDb::Movie:0x007f92 @id=13, @title="Forrest Gump", ...>,
#     #<TMDb::Movie:0x007f93 @id=711, @title="Finding Forrester", ...>,
#     #<TMDb::Movie:0x007f94 ... >, ...]

TMDb::Movie.search('wall e', year: 2003)
# => [#<TMDb::Movie:0x007f92 @id=10681, @original_title="WALL·E", ...>]
```
You also have another options that you can use to filter the search: `:page`,
`:language`, `:include_adult` and `:year`.

### Alternative titles
Get the alternative titles for a specific movie id.

```ruby
TMDB::Movie.alternative_titles(598)
# => [{"iso_3166_1"=>"RU", "title"=>"Город бога"},
# {"iso_3166_1"=>"IT", "title"=>"City of God - La città di Dio"},
# {"iso_3166_1"=>"BR", "title"=>"Cidade de Deus"},
# {"iso_3166_1"=>"FR", "title"=>"La cité de Dieu"},
# {"iso_3166_1"=>"DE", "title"=>"City of God"},
# {"iso_3166_1"=>"CN", "title"=>"上帝之城"},
# {"iso_3166_1"=>"HK", "title"=>"无主之城"},
# {"iso_3166_1"=>"US", "title"=>"City of God"},
# {"iso_3166_1"=>"TW", "title"=>"無法無天"}]

movie.alternative_titles(country: 'br')
# => [{"iso_3166_1"=>"BR", "title"=>"Cidade de Deus"}]
```

### Cast
Get the cast for a specific movie id.

```ruby
TMDb::Movie.cast(550)
# => [
#      {
#        "id"=>819,
#        "name"=>"Edward Norton",
#        "character"=>"The Narrator",
#        "order"=>0,
#        "cast_id"=>4,
#        "profile_path"=>"/588Hrov6wwM9WcU88nJHlw2iufN.jpg"
#      },
#      {
#        "id"=>287,
#        "name"=>"Brad Pitt",
#        "character"=>"Tyler Durden",
#        "order"=>1,
#        "cast_id"=>5,
#        "profile_path"=>"/kc3M04QQAuZ9woUvH3Ju5T7ZqG5.jpg"
#      },
#      {
#        ...
#      }
#    ]

### Crew
Get the crew for a specific movie id.

```ruby
TMDb::Movie.crew(550)
# => [
#      {
#        "id"=>7469,
#        "name"=>"Jim Uhls",
#        "department"=>"Writing",
#        "job"=>"Author",
#        "profile_path"=>nil
#      },
#      {
#        "id"=>7474,
#        "name"=>"Ross Grayson Bell",
#        "department"=>"Production",
#        "job"=>"Producer",
#        "profile_path"=>nil
#      },
#      {
#        ...
#      }
#    ]

### Images
Get the images (posters and backdrops) for a specific movie id.

```ruby
TMDb::Movie.images(598)
# => {"id"=>598,
#     "backdrops"=> [
#       {
#         "file_path"=>"/hSaH9tt67bozo9K50sbH0s4YjEc.jpg",
#         "width"=>1532,
#         "height"=>862,
#         "iso_639_1"=>nil,
#         "aspect_ratio"=>1.78,
#        "vote_average"=>5.4421768707483,
#         "vote_count"=>7
#       },
#       {
#         "file_path"=>"/k4BAPrE5WkNLvpsPsiMfu8W4Zyi.jpg",
#         "width"=>1920,
#         "height"=>1080,
#         "iso_639_1"=>nil,
#         "aspect_ratio"=>1.78,
#         "vote_average"=>5.399159663865546,
#         "vote_count"=>5
#       },
#       {
#         ...
#       }
#     ]}

TMDb::Movie.images(598, language: 'pt')
```

### Movie keywords

Get the plot keywords for a specific movie id.

```ruby
TMDb::Movie.keywords(68721)
# => [
#      {"id"=>2651, "name"=>"nanotechnology"},
#      {"id"=>9715, "name"=>"superhero"},
#      {"id"=>180547, "name"=>"marvel cinematic universe"},
#      {"id"=>156792, "name"=>"3d"},
#      {"id"=>156395, "name"=>"imax"},
#      {"id"=>179430, "name"=>"aftercreditsstinger"},
#      {"id"=>10836, "name"=>"third part"}
#    ]
```

### Movie trailers

Get the trailers for a specific movie id.

```ruby
TMDb::Movie.trailers(68721)
# => {"id"=>68721, 
#     "quicktime"=> [  
#       {
#         "name"=>"Teaser"
#         "sources"=> [
#           {"size"=>"480p","source"=>"http://trailers.apple.com/movies/marvel/ironman3/ironman3-tlr1-m4mb0_h480p.mov"},
#           {"size"=>"720p","source"=>"http://trailers.apple.com/movies/marvel/ironman3/ironman3-tlr1-m4mb0_h720p.mov"},
#           {"size"=>"1080p","source"=>"http://trailers.apple.com/movies/marvel/ironman3/ironman3-tlr1-m4mb0_h1080p.mov"}
#         ]
#       }
#     "youtube"=> [
#       {
#         "name"=>"Iron Man 3 Trailer 2",
#         "size"=>"HD",
#         "source"=>"YLorLVa95Xo",
#         "type"=>"Trailer"
#       }
#     ]
#   }
```

### Movie releases

Get the release date by country for a specific movie id.

```ruby
TMDb::Movie.releases(68721)
# => [
#      {"iso_3166_1"=>"US", "certification"=>"PG-13", "release_date"=>"2013-05-03"},
#      {"iso_3166_1"=>"DE", "certification"=>"12", "release_date"=>"2013-04-30"},
#      {"iso_3166_1"=>"FR", "certification"=>"", "release_date"=>"2013-04-24"},
#      {"iso_3166_1"=>"BG", "certification"=>"C", "release_date"=>"2013-04-26"},
#      {"iso_3166_1"=>"NL", "certification"=>"", "release_date"=>"2013-04-24"},
#      {"iso_3166_1"=>"NO", "certification"=>"", "release_date"=>"2013-04-26"},
#      ...,
#    ]
```

### Upcoming movies

Get the list of upcoming movies. This list refreshes every day.
The maximum number of items this list will include is 100.

```ruby
TMDb::Movie.upcoming
# => [
#      #<TMDb::Movie:0x007fefa4202a10
#       @adult=false,
#       @backdrop_path="/rwibG3yurWQvpjut54nbeiSGhVt.jpg",
#       @id=157375,
#       @original_title="The Lifeguard",
#       @popularity=8.708121262,
#       @poster_path="/xoX6C3mLynwSNRij2tyDT5eVmoc.jpg",
#       @release_date="2013-08-30",
#       @title="The Lifeguard",
#       @vote_average=5.5,
#       @vote_count=3>
#    ]
```

### Find a person by ID

Get the basic person information for a specific person id.

```ruby
TMDB::Person.find(138)
# => #<TMDb::Person:0x007ff02a081278 @adult=false, @id=138, @imdb_id="nm0000233", @name="Quentin Tarantino" ... >
```

Available attributes: `id`, `name`, `adult`, `also_known_as`, `biography`
`birthday`, `deathday`, `homepage`, `place_of_birth`, `profile_path`, `popularity`, `imdb_id`.

### Search people
Search for people by name.

```ruby
TMDb::Person.search('Paul')
# => [#<TMDb::Person:0x007fb572c30558 @id=8167, @name="Paul Walker", ...>,
#     #<TMDb::Person:0x007fb572c302b0 @id=5129, @name="Paul Reubens", ...>, ...]

TMDb::Person.search('Paul', page: 4)
# => [#<TMDb::Person:0x007fb572d68d80 @id=455, @name="Paul Haggis", ...>, ...]
```
Available options are `:page` and `:include_adult`.

### Person images

Gets the images for a specific person id.

```ruby
TMDb::Person.images(138)
# => {"id" => 138,
# 			"profiles" => [
# 				{
# 					"file_path" => "/iws3gBdQJ6tF7x6CIpepYfUKc58.jpg",
# 					"width" => 1000,
# 					"height" => 1500,
# 					"iso_639_1" => nil,
# 					"aspect_ratio" => 0.67
# 				},
# 				{
# 					"file_path" => "/ubJ3VWz1Zr7dempsJGH8lgREkrS.jpg",
# 					"width" => 399,
# 					"height" => 599,
# 					"iso_639_1" => nil,
# 					"aspect_ratio" => 0.67
# 			}]
# 		}
```

### Popular people

Gets a list of popular people.

```ruby
TMDb::Person.popular
# => [
# 	#<TMDb::Person:0x007ff0289d1550
# 	  @adult=false,
# 	  @id=18918,
# 	  @name="Dwayne Johnson",
# 	  @popularity=27.5754694040027,
# 	  @profile_path="/gQIWcpYo2W4MHw8UhTP2cW0jojF.jpg">,
# 	#<TMDb::Person:0x007ff0289d1208
# 	  @adult=false,
# 	  @id=12835,
# 	  @name="Vin Diesel",
# 	  @popularity=20.5472519159021,
# 	  @profile_path="/qwyfzMKIhxJ7ols66FgEf7eGdcI.jpg">
# 	]
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

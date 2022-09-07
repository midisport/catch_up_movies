# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



# https://www.omdbapi.com/?apikey=9695b4ac&t=

# puts "destroying artists"
# Artist.destroy_all
# puts "destroying castings"
# Casting.destroy_all


puts "destroying users"
User.destroy_all
puts "destroying cinemas"
Cinema.destroy_all
puts "destroying movies"
Movie.destroy_all
puts "destroying follows"
Follow.destroy_all
puts "destroying movie shows"
MovieShow.destroy_all
puts "destroying bookings"
Booking.destroy_all

# Users
puts "creating users"
user1 = User.create!(username: "Nabil", email: "test@test.fr", password: '123456', avatar: "https://avatars.githubusercontent.com/u/103263066?v=4")
user2 = User.create!(username: "Youssef", email: "test1@test.fr", password: '123456', avatar: "https://avatars.githubusercontent.com/u/107563983?v=4")
user3 = User.create!(username: "Samuel", email: "test2@test.fr", password: '123456', avatar: "https://avatars.githubusercontent.com/u/66734463?v=4")
user4 = User.create!(username: "Lazare", email: "test3@test.fr", password: '123456', avatar: "https://avatars.githubusercontent.com/u/106976689?v=4")

20.times do
  User.create(username: Faker::Internet.unique.username, email: Faker::Internet.unique.email, password: '123456', avatar: "https://i.pravatar.cc/150?img=#{rand 1..70}")
end

# Follows
puts "creating follows"
Follow.create!(follower: user1, followed: user2)
Follow.create!(follower: user2, followed: user3)
Follow.create!(follower: user3, followed: user4)
Follow.create!(follower: user3, followed: user2)
Follow.create!(follower: user4, followed: user1)
puts "follows created"

15.times do
  # Not with ! on purpose, as this autogeneration will likely attempt to recreate follows that exist already
  Follow.create(follower: User.all.sample, followed: User.all.sample)
end

# Cinemas
puts "create Cinémas"
cinema1 = Cinema.new(
  lat: 48.873073,
  lng: 2.298394,
  name: "UGC GEORGE V",
  address: "146 AVENUE DES CHAMPS ELYSEES"
  )
cinema1.save!
cinema2 = Cinema.new(
  lat: 48.872265,
  lng: 2.300938,
  name: "UGC NORMANDIE",
  address: "116 AVENUE DES CHAMPS ELYSEES"
  )
cinema2.save!
cinema3 = Cinema.new(
  lat: 48.872431,
  lng: 2.299525,
  name: "BALZAC",
  address: "1 RUE BALZAC"
  )
cinema3.save!
cinema4 = Cinema.new(
  lat: 48.869654,
  lng: 2.306873,
  name: "GAUMONT CHAMPS ELYSEES MARIGNAN",
  address: "27/33 AVENUE DES CHAMPS ELYSEES"
  )
cinema4.save!
cinema5 = Cinema.new(
  lat: 48.870512,
  lng: 2.303157,
  name: "ELYSEES LINCOLN",
  address: "14 RUE LINCOLN"
  )
cinema5.save!
cinema6 = Cinema.new(
  lat: 48.871332,
  lng: 2.335302,
  name: " UGC OPERA",
  address: "32 BD DES ITALIENS"
  )
cinema6.save!
cinema7 = Cinema.new(
  lat: 48.871363,
  lng: 2.344886,
  name: "MAX LINDER",
  address: "24 BD POISSONNIERE"
  )
cinema7.save!
cinema8 = Cinema.new(
  lat: 48.86872,
  lng: 2.347608,
  name: "GRAND REX",
  address: "5 BD POISSONNIERE"
  )
cinema8.save!
cinema9 = Cinema.new(
  lat: 48.870632,
  lng: 2.334338,
  name: "PATHE",
  address: "32 RUE LOUIS LEGRAND"
  )
cinema9.save!
cinema10 = Cinema.new(
  lat: 48.84351,
  lng: 2.325646,
  name: "UGC MONTPARNASSE",
  address: "83 BD DU MONTPARNASSE"
  )
cinema10.save!
cinema11 = Cinema.new(
  lat: 48.843074,
  lng: 2.324424,
  name: "GAUMONT PARNASSE",
  address: "3 RUE D'ODESSA"
  )
cinema11.save!
cinema12 = Cinema.new(
  lat: 48.83393,
  lng: 2.31652,
  name: "ENTREPOT",
  address: "7 ET 9 RUE FRANCIS DE PRESSENSE"
  )
cinema12.save!
cinema13 = Cinema.new(
  lat: 48.861555,
  lng: 2.352217,
  name: "MK2 BEAUBOURG",
  address: "50 RUE RAMBUTEAU"
  )
cinema13.save!
cinema14 = Cinema.new(
  lat: 48.878512,
  lng: 2.282965,
  name: "UGC MAILLOT",
  address: "PALAIS CONGRES PL PORTE MAILLOT"
  )
cinema14.save!
cinema15 = Cinema.new(
  lat: 48.852188,
  lng: 2.342788,
  name: "MK2 ODEON COTE SAINT-MICHEL",
  address: "7 RUE HAUTEFEUILLE"
  )
cinema15.save!
cinema16 = Cinema.new(
  lat: 48.852437,
  lng: 2.338266,
  name: "MK2 ODEON COTE SAINT-GERMAIN",
  address: "113 BD ST GERMAIN"
  )
cinema16.save!
cinema17 = Cinema.new(
  lat: 48.851619,
  lng: 2.347076,
  name: "STUDIO GALANDE",
  address: "42 RUE GALANDE"
  )
cinema17.save!
cinema18 = Cinema.new(
  lat: 48.84824,
  lng: 2.340797,
  name: "LUXEMBOURG",
  address: "67 69 RUE MONSIEUR LE PRINCE"
  )
cinema18.save!
cinema19 = Cinema.new(
  lat: 48.853361,
  lng: 2.34211,
  name: "ST ANDRE DES ARTS",
  address: "30 RUE ST ANDRE DES ARTS"
  )
cinema19.save!
cinema20 = Cinema.new(
  lat: 48.842813,
  lng: 2.330525,
  name: "MK2 PARNASSE",
  address: "11 RUE JULES CHAPLAIN"
  )
cinema20.save!
cinema21 = Cinema.new(
  lat: 48.842318,
  lng: 2.328975,
  name: "UGC ROTONDE",
  address: "103 BD DU MONTPARNASSE"
  )
cinema21.save!
cinema22 = Cinema.new(
  lat: 48.843752,
  lng: 2.324925,
  name: "BRETAGNE",
  address: "73 BD DU MONTPARNASSE"
  )
cinema22.save!
cinema23 = Cinema.new(
  lat: 48.844244,
  lng: 2.330407,
  name: "LUCERNAIRE FORUM",
  address: "53 RUE NOTRE DAME DES CHAMPS"
  )
cinema23.save!
cinema24 = Cinema.new(
  lat: 48.842443,
  lng: 2.327625,
  name: "PARNASSIEN",
  address: "98 BD DU MONTPARNASSE"
  )
cinema24.save!
cinema25 = Cinema.new(
  lat: 48.872794,
  lng: 2.296984,
  name: "PUBLICIS ELYSEES",
  address: "133 AV DES CHAMPS ELYSEES"
  )
cinema25.save!
cinema26 = Cinema.new(
  lat: 48.854455,
  lng: 2.340132,
  name: "CHRISTINE CINEMA CLUB",
  address: "4 RUE CHRISTINE"
  )
cinema26.save!
cinema27 = Cinema.new(
  lat: 48.85467,
  lng: 2.333052,
  name: "ST GERMAIN DES PRES",
  address: "22 RUE GUILLAUME APOLLINAIRE"
  )
cinema27.save!
cinema28 = Cinema.new(
  lat: 48.870455,
  lng: 2.35466,
  name: "L'ARCHIPEL",
  address: "17 BD DE STRASBOURG"
  )
cinema28.save!
cinema29 = Cinema.new(
  lat: 48.871771,
  lng: 2.355398,
  name: "LE BRADY",
  address: "39 BOULEVARD DE STRASBOURG"
  )
cinema29.save!
cinema30 = Cinema.new(
  lat: 48.861424,
  lng: 2.345829,
  name: "UGC CINE CITE LES HALLES",
  address: "101 RUE BERGER"
  )
cinema30.save!
cinema31 = Cinema.new(
  lat: 48.858689,
  lng: 2.353591,
  name: "LUMINOR HOTEL DE VILLE",
  address: "20 RUE DU TEMPLE"
  )
cinema31.save!
cinema32 = Cinema.new(
  lat: 48.858204,
  lng: 2.282104,
  name: "MAJESTIC PASSY",
  address: "18 - 20 RUE DE PASSY"
  )
cinema32.save!
cinema33 = Cinema.new(
  lat: 48.875715,
  lng: 2.294655,
  name: "MAC MAHON",
  address: "5/7 AV MAC MAHON"
  )
cinema33.save!
cinema34 = Cinema.new(
  lat: 48.87561,
  lng: 2.32791,
  name: "CAUMARTIN",
  address: "101 RUE ST LAZARE"
  )
cinema34.save!
cinema35 = Cinema.new(
  lat: 48.884303,
  lng: 2.326888,
  name: "LE CINEMA DES CINEASTES",
  address: "7 AVENUE DE CLICHY"
  )
cinema35.save!
cinema36 = Cinema.new(
  lat: 48.883938,
  lng: 2.328034,
  name: "PATHE WEPLER",
  address: "132 -140 BOULEVARD DE CLICHY"
  )
cinema36.save!
cinema37 = Cinema.new(
  lat: 48.886142,
  lng: 2.335342,
  name: "STUDIO 28",
  address: "10 RUE THOLOZE"
  )
cinema37.save!
cinema38 = Cinema.new(
  lat: 48.885073,
  lng: 2.371493,
  name: "MK2 QUAI DE SEINE",
  address: "14 QUAI DE LA SEINE"
  )
cinema38.save!
cinema39 = Cinema.new(
  lat: 48.864763,
  lng: 2.399555,
  name: "MK2 GAMBETTA",
  address: "6 RUE BELGRAND"
  )
cinema39.save!
cinema40 = Cinema.new(
  lat: 48.853157,
  lng: 2.370719,
  name: "MK2 BASTILLE COTE FAUBOURG SAINT-ANTOINE",
  address: "5 RUE DU FAUBOURG ST ANTOINE"
  )
cinema40.save!
cinema41 = Cinema.new(
  lat: 48.860238,
  lng: 2.37214,
  name: "MAJESTIC BASTILLE",
  address: "4 BD RICHARD LENOIR"
  )
cinema41.save!
cinema42 = Cinema.new(
  lat: 48.854674,
  lng: 2.369381,
  name: "MK2 BASTILLE COTE BEAUMARCHAIS",
  address: "3 BD R LENOIR 4/6 BD BEAUMARCHAI"
  )
cinema42.save!
cinema43 = Cinema.new(
  lat: 48.848213,
  lng: 2.39311,
  name: "MK2 NATION",
  address: "133 BOULEVARD DIDEROT"
  )
cinema43.save!
cinema44 = Cinema.new(
  lat: 48.847502,
  lng: 2.371855,
  name: "UGC LYON BASTILLE",
  address: "12 RUE DE LYON"
  )
cinema44.save!
cinema45 = Cinema.new(
  lat: 48.833595,
  lng: 2.38604,
  name: "UGC CINE CITE BERCY",
  address: "2 COUR SAINT-EMILION"
  )
cinema45.save!
cinema46 = Cinema.new(
  lat: 48.847502,
  lng: 2.342301,
  name: "LE CINEMA DU PANTHEON",
  address: "13 RUE VICTOR COUSIN"
  )
cinema46.save!
cinema47 = Cinema.new(
  lat: 48.843204,
  lng: 2.298558,
  name: "CHAPLIN SAINT LAMBERT",
  address: "6 RUE PECLET"
  )
cinema47.save!
cinema48 = Cinema.new(
  lat: 48.837759,
  lng: 2.296259,
  name: "GAUMONT CONVENTION",
  address: "27 RUE ALAIN CHARTIER"
  )
cinema48.save!
cinema49 = Cinema.new(
  lat: 48.830408,
  lng: 2.276322,
  name: "GAUMONT AQUABOULEVARD",
  address: "8/16 RUE DU COLONEL PIERRE AVIA"
  )
cinema49.save!
cinema50 = Cinema.new(
  lat: 48.841914,
  lng: 2.324596,
  name: "GAUMONT MONTPARNOS",
  address: "16 18 RUE D ODESSA"
  )
cinema50.save!
cinema51 = Cinema.new(
  lat: 48.828166,
  lng: 2.327463,
  name: "GAUMONT ALESIA",
  address: "73 AVENUE DU GENERAL LECLERC"
  )
cinema51.save!
cinema52 = Cinema.new(
  lat: 48.833879,
  lng: 2.330976,
  name: "CHAPLIN DENFERT",
  address: "24 PLACE DENFERT ROCHEREAU"
  )
cinema52.save!
cinema53 = Cinema.new(
  lat: 48.851278,
  lng: 2.330648,
  name: "L'ARLEQUIN PANORAMA",
  address: "76 RUE DE RENNES"
  )
cinema53.save!
cinema54 = Cinema.new(
  lat: 48.852138,
  lng: 2.338995,
  name: "UGC DANTON",
  address: "99 BD ST GERMAIN"
  )
cinema54.save!
cinema55 = Cinema.new(
  lat: 48.850764,
  lng: 2.341747,
  name: "NOUVEL ODEON",
  address: "6 RUE DE L ECOLE DE MEDECINE"
  )
cinema55.save!
cinema56 = Cinema.new(
  lat: 48.852353,
  lng: 2.339834,
  name: "UGC ODEON",
  address: "124 BD ST GERMAIN"
  )
cinema56.save!
cinema57 = Cinema.new(
  lat: 48.853093,
  lng: 2.344228,
  name: "ESPACE SAINT MICHEL",
  address: "7 PLACE ST MICHEL"
  )
cinema57.save!
cinema58 = Cinema.new(
  lat: 48.848384,
  lng: 2.348973,
  name: "ECOLES CINEMA CLUB",
  address: "23 RUE DES ECOLES"
  )
cinema58.save!
cinema59 = Cinema.new(
  lat: 48.849983,
  lng: 2.343211,
  name: "LE CHAMPO",
  address: "51 RUE DES ECOLES"
  )
cinema59.save!
cinema60 = Cinema.new(
  lat: 48.849504,
  lng: 2.342788,
  name: "QUARTIER LATIN I",
  address: "9 RUE CHAMPOLLION"
  )
cinema60.save!
cinema61 = Cinema.new(
  lat: 48.842733,
  lng: 2.342044,
  name: "STUDIO DES URSULINES",
  address: "10 RUE DES URSULINES"
  )
cinema61.save!
cinema62 = Cinema.new(
  lat: 48.849591,
  lng: 2.342836,
  name: "REFLET MEDICIS 2",
  address: "7 RUE CHAMPOLLION"
  )
cinema62.save!
cinema63 = Cinema.new(
  lat: 48.841535,
  lng: 2.34958,
  name: "EPEE DE BOIS",
  address: "100 RUE MOUFFETARD"
  )
cinema63.save!
cinema64 = Cinema.new(
  lat: 48.847537,
  lng: 2.352122,
  name: "LE GRAND ACTION",
  address: "5 RUE DES ECOLES"
  )
cinema64.save!
cinema65 = Cinema.new(
  lat: 48.833574,
  lng: 2.353775,
  name: "LES FAUVETTES",
  address: "58 AVENUE DES GOBELINS"
  )
cinema65.save!
cinema66 = Cinema.new(
  lat: 48.832888,
  lng: 2.354241,
  name: "UGC  GOBELINS",
  address: "66 BIS AV DES GOBELINS"
  )
cinema66.save!
cinema67 = Cinema.new(
  lat: 48.836817,
  lng: 2.349632,
  name: "ESCURIAL",
  address: "11 BD PORT ROYAL"
  )
cinema67.save!
cinema68 = Cinema.new(
  lat: 48.8649,
  lng: 2.314116,
  name: "MK2 GRAND PALAIS",
  address: "COURS LA REINE PORTE C"
  )
cinema68.save!
cinema69 = Cinema.new(
  lat: 48.883487,
  lng: 2.349853,
  name: "LE LOUXOR",
  address: "170 BOULEVARD DE MAGENTA"
  )
cinema69.save!
cinema70 = Cinema.new(
  lat: 48.833718,
  lng: 2.373922,
  name: "MK2 BIBLIOTHEQUE",
  address: "128 A 162 AVENUE DE FRANCE"
  )
cinema70.save!
cinema71 = Cinema.new(
  lat: 48.832993,
  lng: 2.378615,
  name: "MK2 A&E",
  address: "15/43 QUAI FRANCOIS MAURIAC"
  )
cinema71.save!
cinema72 = Cinema.new(
  lat: 48.848895,
  lng: 2.282585,
  name: "PATHE BEAUGRENELLE",
  address: "7 RUE LINOIS"
  )
cinema72.save!
cinema73 = Cinema.new(
  lat: 48.876113,
  lng: 2.295345,
  name: "CLUB DE L'ETOILE",
  address: "14 RUE TROYON"
  )
cinema73.save!
cinema74 = Cinema.new(
  lat: 48.893315,
  lng: 2.311503,
  name: "LES 7 BATIGNOLLES CINEMOVIDA",
  address: "ALLEE COLETTE HEILBRONNER"
  )
cinema74.save!
cinema75 = Cinema.new(
  lat: 48.885067,
  lng: 2.374123,
  name: "MK2 QUAI DE LOIRE",
  address: "5/19 QUAI DE LA LOIRE"
  )
cinema75.save!
cinema76 = Cinema.new(
  lat: 48.898991,
  lng: 2.376757,
  name: "UGC CINE CITE PARIS 19",
  address: "166 BOULEVARD MAC DONALD"
  )
cinema76.save!
cinema77 = Cinema.new(
  lat: 48.897016,
  lng: 2.385181,
  name: "PATHE",
  address: "30 AVENUE CORENTIN CARIOU"
  )
cinema77.save!
cinema78 = Cinema.new(
  lat: 48.852605,
  lng: 2.406733,
  name: "CGR PARIS LILAS",
  address: "PLACE DU MAQUIS DU VERCORS"
  )
cinema78.save!



# Movies
puts "creating movies"
movie1 = Movie.new(
  title: "RRR",
  synopsis: "A fictitious story about two legendary revolutionaries and their journey away from home before they started fighting for their country in 1920s.",
  duration: 187,
  poster: "rrr.jpg",
  original_language: "Telugu, English",
  country: "India",
  genre: "Action",
  release_date: 2022,
  imdb_rating: 8,
  director: "S.S. Rajamouli",
  actors: "N.T. Rama Rao Jr., Ram Charan Teja, Ajay Devgn"
)
movie1.save!
movie2 = Movie.new(
  title: "The Nightmare Before Christmas",
  synopsis: "Jack Skellington, king of Halloween Town, discovers Christmas Town, but his attempts to bring Christmas to his home causes confusion.",
  duration: 76,
  poster: "mr_jack.jpg",
  original_language: "English",
  country: "United States",
  genre: "Animation, Family, Fantasy",
  release_date: 1993,
  imdb_rating: 8,
  director: "Henry Selick",
  actors: "Danny Elfman, Chris Sarandon, Catherine O'Hara"
)
movie2.save!
movie3 = Movie.new(
  title: "Lock, Stock and Two Smoking Barrels",
  synopsis: "Eddy persuades his three pals to pool money for a vital poker game against a powerful local mobster, Hatchet Harry. Eddy loses, after which Harry gives him a week to pay back 500,000 pounds.",
  duration: 107,
  poster: "lock_stock.jpg",
  original_language: "English",
  country: "United Kingdom",
  genre: "Action, Comedy, Crime",
  release_date: 1998,
  imdb_rating: 8,
  director: "Guy Ritchie",
  actors: "Jason Flemyng, Dexter Fletcher, Nick Moran"
)
movie3.save!
movie4 = Movie.new(
  title: "Enter the Void",
  synopsis: "An American drug dealer living in Tokyo is betrayed by his best friend and killed in a drug deal. His soul, observing the repercussions of his death, seeks resurrection.",
  duration: 161,
  poster: "enter_the_void.jpg",
  original_language: "English, Japanese",
  country: "France, Germany, Italy, Canada, Japan",
  genre: "Drama, Fantasy",
  release_date: 2009,
  imdb_rating: 7,
  director: "Gaspar Noé",
  actors: "Nathaniel Brown, Paz de la Huerta, Cyril Roy"
)
movie4.save!
movie5 = Movie.new(
  title: "The Thin Red Line",
  synopsis: "Adaptation of James Jones' autobiographical 1962 novel, focusing on the conflict at Guadalcanal during the second World War.",
  duration: 170,
  poster: "ligne_rouge.jpg",
  original_language: "English, Tok Pisin, Japanese, Greek",
  country: "United States",
  genre: "Drama, History, War",
  release_date: 1998,
  imdb_rating: 8,
  director: "Terrence Malick",
  actors: "Jim Caviezel, Sean Penn, Nick Nolte"
)
movie5.save!
movie6 = Movie.new(
  title: "Pulp Fiction",
  synopsis: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.",
  duration: 154,
  poster: "pulp_fiction.jpg",
  original_language: "English, Spanish, French",
  country: "United States",
  genre: "Crime, Drama",
  release_date: 1994,
  imdb_rating: 9,
  director: "Quentin Tarantino",
  actors: "John Travolta, Uma Thurman, Samuel L. Jackson"
)
movie6.save!
puts "movies created"

# Movie shows
puts "creating movie shows"
movie_show1 = MovieShow.new(
  start_at: Time.parse("20:10"),
  date: Date.parse("2022-09-10"),
  language: "Telugu",
  subtitle: "French"
)
movie_show1.movie = movie1
movie_show1.cinema = cinema2
movie_show1.save!
movie_show2 = MovieShow.new(
  start_at: Time.parse("15:30"),
  date: Date.parse("2022-09-10"),
  language: "English",
  subtitle: "French"
)
movie_show2.movie = movie2
movie_show2.cinema = cinema1
movie_show2.save!
movie_show3 = MovieShow.new(
  start_at: Time.parse("19:45"),
  date: Date.parse("2022-09-11"),
  language: "English",
  subtitle: "French"
)
movie_show3.movie = movie3
movie_show3.cinema = cinema1
movie_show3.save!
movie_show4 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-10"),
  language: "French",
  subtitle: ""
)
movie_show4.movie = movie4
movie_show4.cinema = cinema3
movie_show4.save!
movie_show5 = MovieShow.new(
  start_at: Time.parse("18:00"),
  date: Date.parse("2022-09-11"),
  language: "English",
  subtitle: "French"
)
movie_show5.movie = movie4
movie_show5.cinema = cinema3
movie_show5.save!
movie_show6 = MovieShow.new(
  start_at: Time.parse("21:00"),
  date: Date.parse("2022-09-10"),
  language: "English",
  subtitle: "French"
)
movie_show6.movie = movie4
movie_show6.cinema = cinema3
movie_show6.save!
movie_show7 = MovieShow.new(
  start_at: Time.parse("18:00"),
  date: Date.parse("2022-09-10"),
  language: "English",
  subtitle: "French"
)
movie_show7.movie = movie5
movie_show7.cinema = cinema2
movie_show7.save!
movie_show8 = MovieShow.new(
  start_at: Time.parse("21:00"),
  date: Date.parse("2022-09-11"),
  language: "English",
  subtitle: "French"
)
movie_show8.movie = movie5
movie_show8.cinema = cinema2
movie_show8.save!
movie_show9 = MovieShow.new(
  start_at: Time.parse("15:30"),
  date: Date.parse("2022-09-11"),
  language: "English",
  subtitle: "French"
)
movie_show9.movie = movie3
movie_show9.cinema = cinema3
movie_show9.save!
movie_show10 = MovieShow.new(
  start_at: Time.parse("20:15"),
  date: Date.parse("2022-09-11"),
  language: "French",
  subtitle: ""
)
movie_show10.movie = movie2
movie_show10.cinema = cinema12
movie_show10.save!
movie_show11 = MovieShow.new(
  start_at: Time.parse("15:30"),
  date: Date.parse("2022-09-11"),
  language: "Telugu",
  subtitle: "French"
)
movie_show11.movie = movie1
movie_show11.cinema = cinema23
movie_show11.save!
movie_show12 = MovieShow.new(
  start_at: Time.parse("18:30"),
  date: Date.parse("2022-09-11"),
  language: "Telugu",
  subtitle: "French"
)
movie_show12.movie = movie1
movie_show12.cinema = cinema32
movie_show12.save!
movie_show13 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-11"),
  language: "Telugu",
  subtitle: "French"
)
movie_show13.movie = movie1
movie_show13.cinema = cinema13
movie_show13.save!
movie_show14 = MovieShow.new(
  start_at: Time.parse("18:30"),
  date: Date.parse("2022-09-12"),
  language: "Telugu",
  subtitle: "French"
)
movie_show14.movie = movie1
movie_show14.cinema = cinema13
movie_show14.save!
movie_show15 = MovieShow.new(
  start_at: Time.parse("21:30"),
  date: Date.parse("2022-09-12"),
  language: "Telugu",
  subtitle: "French"
)
movie_show15.movie = movie1
movie_show15.cinema = cinema10
movie_show15.save!
movie_show16 = MovieShow.new(
  start_at: Time.parse("17:15"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show16.movie = movie1
movie_show16.cinema = cinema17
movie_show16.save!
movie_show17 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show17.movie = movie1
movie_show17.cinema = cinema17
movie_show17.save!
movie_show18 = MovieShow.new(
  start_at: Time.parse("19:30"),
  date: Date.parse("2022-09-14"),
  language: "French",
  subtitle: ""
)
movie_show18.movie = movie2
movie_show18.cinema = cinema28
movie_show18.save!
movie_show19 = MovieShow.new(
  start_at: Time.parse("17:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show19.movie = movie2
movie_show19.cinema = cinema31
movie_show19.save!
movie_show20 = MovieShow.new(
  start_at: Time.parse("19:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show20.movie = movie2
movie_show20.cinema = cinema34
movie_show20.save!
movie_show21 = MovieShow.new(
  start_at: Time.parse("21:30"),
  date: Date.parse("2022-09-13"),
  language: "English",
  subtitle: "French"
)
movie_show21.movie = movie2
movie_show21.cinema = cinema34
movie_show21.save!
movie_show22 = MovieShow.new(
  start_at: Time.parse("19:30"),
  date: Date.parse("2022-09-12"),
  language: "French",
  subtitle: ""
)
movie_show22.movie = movie2
movie_show22.cinema = cinema30
movie_show22.save!
movie_show23 = MovieShow.new(
  start_at: Time.parse("18:00"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show23.movie = movie3
movie_show23.cinema = cinema31
movie_show23.save!
movie_show24 = MovieShow.new(
  start_at: Time.parse("18:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show24.movie = movie3
movie_show24.cinema = cinema54
movie_show24.save!
movie_show25 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show25.movie = movie3
movie_show25.cinema = cinema39
movie_show25.save!
movie_show26 = MovieShow.new(
  start_at: Time.parse("17:30"),
  date: Date.parse("2022-09-13"),
  language: "English",
  subtitle: "French"
)
movie_show26.movie = movie3
movie_show26.cinema = cinema53
movie_show26.save!
movie_show27 = MovieShow.new(
  start_at: Time.parse("19:00"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show27.movie = movie3
movie_show27.cinema = cinema43
movie_show27.save!
movie_show28 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show28.movie = movie4
movie_show28.cinema = cinema63
movie_show28.save!
movie_show29 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-11"),
  language: "English",
  subtitle: "French"
)
movie_show29.movie = movie4
movie_show29.cinema = cinema31
movie_show29.save!
movie_show30 = MovieShow.new(
  start_at: Time.parse("19:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show30.movie = movie4
movie_show30.cinema = cinema33
movie_show30.save!
movie_show31 = MovieShow.new(
  start_at: Time.parse("22:30"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show31.movie = movie4
movie_show31.cinema = cinema35
movie_show31.save!
movie_show32 = MovieShow.new(
  start_at: Time.parse("21:30"),
  date: Date.parse("2022-09-11"),
  language: "English",
  subtitle: "French"
)
movie_show32.movie = movie5
movie_show32.cinema = cinema35
movie_show32.save!
movie_show33 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show33.movie = movie5
movie_show33.cinema = cinema45
movie_show33.save!
movie_show34 = MovieShow.new(
  start_at: Time.parse("22:30"),
  date: Date.parse("2022-09-12"),
  language: "English",
  subtitle: "French"
)
movie_show34.movie = movie5
movie_show34.cinema = cinema39
movie_show34.save!
movie_show35 = MovieShow.new(
  start_at: Time.parse("20:30"),
  date: Date.parse("2022-09-13"),
  language: "French",
  subtitle: ""
)
movie_show35.movie = movie5
movie_show35.cinema = cinema39
movie_show35.save!
movie_show36 = MovieShow.new(
  start_at: Time.parse("22:30"),
  date: Date.parse("2022-09-13"),
  language: "English",
  subtitle: "French"
)
movie_show36.movie = movie5
movie_show36.cinema = cinema45
movie_show36.save!

puts "Movie_shows created"

# Bookings
puts "Creating bookings"

Booking.create!(user: user3, movie_show: movie_show1)
Booking.create!(user: user3, movie_show: movie_show2)
Booking.create!(user: user3, movie_show: movie_show3)
Booking.create!(user: user3, movie_show: movie_show4)
Booking.create!(user: user3, movie_show: movie_show5)
Booking.create!(user: user1, movie_show: movie_show6)
Booking.create!(user: user1, movie_show: movie_show7)
Booking.create!(user: user2, movie_show: movie_show8)
Booking.create!(user: user2, movie_show: movie_show9)
Booking.create!(user: user4, movie_show: movie_show10)

30.times do
  Booking.create(user: User.all.sample, movie_show: MovieShow.all.sample)
end

puts "Bookings created"

puts "Generating Interests"
  30.times do
    Interest.create(user: User.all.sample, movie: Movie.all.sample)
  end
puts "Interests created"

# # Interests
# puts "creating interests"
# Interest.create!(user: user3, movie: movie6)
# Interest.create!(user: user3, movie: movie5)
# Interest.create!(user: user3, movie: movie4)
# Interest.create!(user: user1, movie: movie1)
# Interest.create!(user: user1, movie: movie2)
# Interest.create!(user: user1, movie: movie6)
# Interest.create!(user: user2, movie: movie6)
# Interest.create!(user: user2, movie: movie3)
# Interest.create!(user: user2, movie: movie4)
# Interest.create!(user: user4, movie: movie1)
# Interest.create!(user: user4, movie: movie6)
# Interest.create!(user: user4, movie: movie3)
#
# puts "interests created"
#
#
# # Artists
# puts "creating artists"
# artist1 = Artist.new(
#   name: "Gaspar Noé",
#   photo: "gaspard_noe.jpg"
# )
# artist1.save!
# artist2 = Artist.new(
#   name: "Terrence Malick",
#   photo: "terence_malick.jpg"
# )
# artist2.save!
# artist3 = Artist.new(
#   name: "Guy Ritchie",
#   photo: "guy_ritchie.jpg"
# )
# artist3.save!
# artist4 = Artist.new(
#   name: "S. S. Rajamouli",
#   photo: "rajamouli.jpg"
# )
# artist4.save!
# artist5 = Artist.new(
#   name: "John Travolta",
#   photo: "travolta.jpg"
# )
# artist5.save!
#
#
# # Casting
# puts "creating castings"
# casting1 = Casting.new(
#   role: "Réalisateur"
# )
# casting1.movie = movie4
# casting1.artist = artist1
# casting1.save!
# casting2 = Casting.new(
#   role: "Réalisateur"
# )
# casting2.movie = movie5
# casting2.artist = artist2
# casting2.save!
# casting3 = Casting.new(
#   role: "Réalisateur"
# )
# casting3.movie = movie3
# casting3.artist = artist3
# casting3.save!
# casting4 = Casting.new(
#   role: "Réalisateur"
# )
# casting4.movie = movie1
# casting4.artist = artist4
# casting4.save!
# casting5 = Casting.new(
#   role: "Acteur"
# )
# casting5.movie = movie5
# casting5.artist = artist5
# casting5.save!
# casting6 = Casting.new(
#   role: "Acteur"
# )
# casting6.movie = movie6
# casting6.artist = artist5
# casting6.save!

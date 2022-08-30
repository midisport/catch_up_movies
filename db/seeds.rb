# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "destroying users"
User.destroy_all
puts "destroying movies"
Movie.destroy_all
puts "destroying cinemas"
Cinema.destroy_all
puts "destroying artists"
Artist.destroy_all
# puts "destroying movie shows"
# MovieShow.destroy_all

puts "creating users"
user1 = User.create!(username: "Nabil", email: "test@test.fr", password: '123456')
user2 = User.create!(username: "Youssef", email: "test1@test.fr", password: '123456')
user3 = User.create!(username: "Samuel", email: "test2@test.fr", password: '123456')
user4 = User.create!(username: "Lazare", email: "test2@test.fr", password: '123456')

puts "creating movies"
movie1 = Movie.new{
  title: "RRR",
  synopsis: "Une histoire fictive sur deux révolutionnaires légendaires et leur voyage loin de chez eux avant qu'ils ne commencent à se battre pour leur pays dans les années 1920.",
  duration: 187,
  poster: "rrr_poster.jpg",
  original_language: "Indien",
  country: "Inde",
  genre: "Action",
  release_date: 2022,
  imbd_rating: 8.0
}
movie1.save!
movie2 = Movie.new{
  title: "L'étrange Noël de monsieur Jack",
  synopsis: "Jack Skellington, roi de la ville d'Halloween, fait la découverte de la ville de Noël, mais ses tentatives de ramener Noël chez lui deviennent source de confusion.",
  duration: 76,
  poster: "mr_jack_poster.jpg",
  original_language: "Anglais",
  country: "Etats-Unis",
  genre: "Animation",
  release_date: 1993,
  imbd_rating: 7.9
}
movie2.save!
movie3 = Movie.new{
  title: "Arnaques, crimes et botanique",
  synopsis: "Un jeu de cartes bâclé à Londres incite quatre amis, des voyous, des cultivateurs de mauvaise herbe, des gangsters, des usuriers et des créanciers à se faire entrer en collision dans une série d'événements inattendus, le tout dans un souci d'argent, de cannabis et de deux anciens fusils.",
  duration: 107,
  poster: "lock_stock_barrel_poster.jpg",
  original_language: "Anglais",
  country: "Angleterre",
  genre: "Comédie",
  release_date: 1998,
  imbd_rating: 8.2
}
movie3.save!
movie4 = Movie.new{
  title: "Enter the Void",
  synopsis: "Un trafiquant de drogue français vivant à Tokyo est trahi par son meilleur ami et tué dans une affaire de drogue. Son âme, observant les répercussions de sa mort, cherche la résurrection.",
  duration: 161,
  poster: "enter_the_void_poster.jpg",
  original_language: "Anglais",
  country: "France",
  genre: "Drame",
  release_date: 2009,
  imbd_rating: 7.2
}
movie4.save!
movie5 = Movie.new{
  title: "La Ligne Rouge",
  synopsis: "Adaptation du roman autobiographique de James Jones datant de 1962, axé sur le conflit de Guadalcanal pendant la seconde guerre mondiale.",
  duration: 170,
  poster: "ligne_rouge_poster.jpg",
  original_language: "Anglais",
  country: "Etats-Unis",
  genre: "Guerre",
  release_date: 1998,
  imbd_rating: 7.6
}
movie5.save!
movie6 = Movie.new{
  title: "Pulp Fiction",
  synopsis: "Les vies de deux hommes de main, d'un boxeur, de la femme d'un gangster et de deux braqueurs s'entremêlent dans quatre histoires de violence et de rédemption.",
  duration: 154,
  poster: "pulp_fiction_poster.jpg",
  original_language: "Anglais",
  country: "Etats-Unis",
  genre: "Drame",
  release_date: 1994,
  imbd_rating: 8.9
}
movie6.save!

cinéma1 = Cinema.new {
  lat: 48.85462324446117,
  lng: 2.369382443779865,
  name: "Mk2 - Bastille",
  type: "Multiplex",
  address: "4 Bd Beaumarchais",
}
cinéma1.save!
cinéma2 = Cinema.new {
  lat: 48.84994515786409,
  lng: 2.3432563614260578,
  name: "Le Champo - Espace Jacques Tati",
  type: "Art et Essai",
  address: "51 Rue des Écoles, 75005 Paris"
}
cinéma2.save!
cinéma3 = Cinema.new {
  lat: 48.837275464447245,
  lng: 2.3824665121839663,
  name: "La Cinémathèque française",
  type: "Art et Essai",
  address: "51 Rue de Bercy, 75012 Paris"
}
cinéma3.save!

puts "creating artists"
artist1 = Artist.new {
  name: "Gaspard Noé",
  photo: "gaspard_noe.jpg"
}
artist1.save!
artist2 = Artist.new {
  name: "Terrence Malick",
  photo: "terence_malick.jpg"
}
artist2.save!
artist3 = Artist.new {
  name: "Guy Ritchie",
  photo: "guy_ritchie.jpg"
}
artist3.save!
artist4 = Artist.new {
  name: "S. S. Rajamouli",
  photo: "rajamouli.jpg"
}
artist4.save!
artist5 = Artist.new {
  name: "John Travolta",
  photo: "travolta.jpg"
}
artist5.save!

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# at Potsdamer Platz
Partner.create([
  name: "Johnson McTest",
  experience: %w[wood carpet tiles],
  lat: 52.509232,
  lon: 13.375840,
  operating_radius: 20_000,
  rating: 3
])

# at Bhf Lichtenberg
Partner.create([
  name: "Martin Router King",
  experience: %w[carpet],
  lat: 52.514560,
  lon: 13.498310,
  operating_radius: 15_000,
  rating: 5
])

# at Bhf Südkreuz
Partner.create([
  name: "Mr Lazy",
  experience: %w[wood carpet tiles],
  lat: 52.454720,
  lon: 13.576360,
  operating_radius: 15_000,
  rating: 4
])

# at Bhf Südkreuz
Partner.create([
  name: "Mr Lazy2",
  experience: %w[wood carpet tiles],
  lat: 52.454720,
  lon: 13.576360,
  operating_radius: 15_000,
  rating: 5
])

# at Bhf Südkreuz
Partner.create([
  name: "Mr Onlywood",
  experience: %w[wood],
  lat: 52.454720,
  lon: 13.576960,
  operating_radius: 3000,
  rating: 1
])

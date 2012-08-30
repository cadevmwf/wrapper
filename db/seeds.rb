# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

User.create email: 'r@r.com', facebook_access_token: 'AAACEdEose0cBAPKFFTYWKn1JWRBrNPLt5sEdicARtvo3Q2GaAZAT3n24yalAwLSYhEE5PZCS8rZCZBZAGzqmxLZAYeYRd2FvKAOB4abavjawZDZD'

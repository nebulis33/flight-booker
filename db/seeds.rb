# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(airport_code: 'SFO')
Airport.create(airport_code: 'NYC')
Airport.create(airport_code: 'DAY')
Airport.create(airport_code: 'CEZ')
Airport.create(airport_code: 'DFW')
Airport.create(airport_code: 'GRB')

20.times do
    start_airport = rand(1..6)
    finish_airport = rand(1..6)
    start = DateTime.now + rand(30)
    finish = start + rand(1)
    Flight.create!(from_airport_id: start_airport, to_airport_id: finish_airport, start_datetime: start, end_datetime: finish, flight_duration: (finish - start))
end
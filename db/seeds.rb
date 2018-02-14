# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Admin.create(name: 'Colin Gerety', email: 'colin@frii.com', password: 'mlSuperUserPW') 
  Place.create(name: 'Momo Lolo Coffee House', street_address: '1129 W. Elizabeth St.', city_state: 'Fort Collins, Colorado 80521')

  Barista.create(first: 'Colin', last: 'Gerety', currently_working: true)
  Barista.create(first: 'Arian', last: 'Brazenwood', currently_working: true)
  Barista.create(first: 'Cameron', last: 'Morris', currently_working: true)
  Barista.create(first: 'Chelsea', last: 'Skorka', currently_working: true)
  Barista.create(first: 'Hannah', last: 'Circenis', currently_working: true)
  Barista.create(first: 'Jaimi', last: 'Mostellar', currently_working: true)
  Barista.create(first: 'Josh', last: 'Cornal', currently_working: true)
  Barista.create(first: 'Kayl', last: 'Ecton', currently_working: true)
  Barista.create(first: 'Lauren', last: 'Sneed', currently_working: true)
  Barista.create(first: 'Ruth', last: 'Morris', currently_working: true)
  Barista.create(first: 'Zach', last: 'Prevedel', currently_working: true)


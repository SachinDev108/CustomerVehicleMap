# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'seed.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
	customer = Customer.create( address: row[0], city: row[1], state: row[2], zip: row[3], email: row[4], phone: row[5], lat: row[6], lng: row[7], name: row[8])
	customer.vehicles.create(year: '2000', make: '2018-01-01', model: 'xyz model', trim: '101', style: 'Chevrolet', vin: '1HGBH41JXMN109186')
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

properties = Property.create([{ name: 'Name', value: 'Foo' }, { name: 'ExternalID', value: 'ABC123'}, { name: 'Other', value: 'Bar' }])
product = Product.new
product.properties << properties
product.save
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
Product.create!(
	title: 'India Pale Ale',
	description: 'A hoppy version of the traditional Pale Ale',
	image_url: 'http://laurelwoodbrewpub.com/wp-content/uploads/2011/06/IPA-PINT.png',
	price: 4.75
	)
Product.create!(
	title: 'Stout',
	description: 'A dark and delicious beer you should not fear',
	image_url: 'http://laurelwoodbrewpub.com/wp-content/uploads/2011/06/STOUT-PINT.png',
	price: 4.75
	)
Product.create!(
	title: 'Red',
	description: 'A red beer',
	image_url: 'http://laurelwoodbrewpub.com/wp-content/uploads/2013/07/New-Red-Pint-WIth-Logo.png',
	price: 4.75
	)
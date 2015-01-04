require 'test_helper'

class ProductTest < ActiveSupport::TestCase

	fixtures :products

	test "product attributes must not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
	end

	test "product is not valid without a unique title" do
		product = Product.new(
			title: products(:ruby).title,
			description: "blah blah de blah",
			price: 1,
			image_url: "someimg.jpg"
			)
		assert product.invalid?
		assert_equal ["has already been taken"], product.errors[:title]
	end

	test "product price must be positive" do
		product = Product.new(
			title: "Some Title",
			description: "blah blah de blah",
			image_url: "someimg.jpg"
			)

		product.price = -1
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

		product.price = 0
		assert product.invalid?
		assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

		product.price = 1
		assert product.valid?
	end

	def new_product(image_url)
		Product.new(
			title: "Some Title",
			description: "blah blah de blah",
			price: 1,
			image_url: image_url
			)
	end

	test "image url" do
		ok = %w{ beer.gif beer.jpg beer.png BEER.JPG BEER.Jpg http://beer.com/b/e/e/r/beer.gif }
		bad = %w{ beer.doc beer.gif/morebeer beer.gif.beer }
		ok.each do |name|
			assert new_product(name).valid?, "#{name} should be valid"
		end
		bad.each do |name|
			assert new_product(name).invalid?, "#{name} shouldn't be valid"
		end
	end

end

require_relative 'test_helper'
require_relative '../lib/item'

class ItemTest < Minitest::Test
	attr_reader :item

	def setup
		attributes = { id: "1",
									 name: "item1",
									 description: "here is a description",
									 unit_price: "2.99",
									 merchant_id: "2",
									 created_at: "2012-03-27 14:53:59 UTC",
									 updated_at: "2012-03-27 14:53:59 UTC" }
		repository = []
		@item       = Item.new(attributes, repository)
	end

	def test_it_exists
		assert Item
	end

	def test_it_assigns_correct_attributes
		assert_equal "1", item.id
		assert_equal "item1", item.name
		assert_equal "here is a description", item.description
		assert_equal "2.99", item.unit_price
		assert_equal "2", item.merchant_id
		assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
		assert_equal "2012-03-27 14:53:59 UTC", item.created_at
	end

	def test_it_has_a_repository
		assert item.repository
	end
end

require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test
	attr_reader :merchant

	def setup
		attributes = { id: "1",
									 name: "Example",
									 created_at: "2012-03-27 14:53:00 UTC",
									 updated_at: "2012-03-27 14:53:59 UTC" }
		@merchant = Merchant.new(attributes)
	end

	def test_it_exists
		assert Merchant
	end

	def test_it_assigns_correct_attributes
		assert_equal "1", merchant.id
		assert_equal "Example", merchant.name
		assert_equal "2012-03-27 14:53:00 UTC", merchant.created_at
		assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
	end
end

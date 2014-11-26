require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

	def test_it_has_a_sales_engine
		sales_engine        = Minitest::Mock.new
		merchant_repository = MerchantRepository.new(sales_engine, "")
		assert merchant_repository.sales_engine
	end	

	def test_it_delegates_items_to_sales_engine
		sales_engine        = Minitest::Mock.new
		merchant_repository = MerchantRepository.new(sales_engine, "")
		sales_engine.expect(:find_items_from_merchant, nil, ["1"])
		merchant_repository.find_items_from("1")
		sales_engine.verify
	end
end

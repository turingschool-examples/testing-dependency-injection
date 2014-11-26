class MerchantRepository
	attr_reader :sales_engine

	def initialize(sales_engine, filepath)
		@sales_engine = sales_engine
	end

	def find_items_from(id)
		sales_engine.find_items_from_merchant(id)
	end
end

class SalesEngine
	def find_items_from_merchant(id)
		items_repository.find_by(:merchant_id, id)
	end
end

class ItemRepository
	def find_by(attribute, value)
		all.select { |item| item.send(attribute) == value}
												item.merchant_id     == value
	end
end

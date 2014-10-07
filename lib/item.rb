class Item
	attr_reader :id,
							:name,
							:description,
							:unit_price,
							:merchant_id,
							:created_at,
							:updated_at,
							:repository

	def initialize(attributes, repository)
		@id 					= attributes[:id]
		@name 				= attributes[:name]
		@description 	= attributes[:description]
		@merchant_id 	= attributes[:merchant_id]
		@unit_price 	= attributes[:unit_price]
		@updated_at 	= attributes[:updated_at]
		@created_at 	= attributes[:created_at]
		@repository   = repository
	end
end

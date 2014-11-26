class Merchant
	attr_reader :id,
							:name,
							:created_at,
							:updated_at, 
							:repository

	def initialize(attributes, parent)
		@id 					= attributes[:id]
		@name 				= attributes[:name]
		@created_at 	= attributes[:created_at]
		@updated_at 	= attributes[:updated_at]
		@repository   = parent
	end

	def items
		repository.find_items_from(id)
	end

	def invoices
		repository.find_invoices_from(id)
	end
end


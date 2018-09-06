module ItemsHelper
	def get_total_amount(tax_type,tax,rate)
		total_amount = 0
		if tax_type == 1
			total_amount = rate+(rate * tax) / 100
		else
			total_amount = rate + tax
		end
		return total_amount
	end
end

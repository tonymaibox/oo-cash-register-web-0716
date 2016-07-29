require 'pry'

class CashRegister

attr_accessor :total, :discount, :items, :transaction

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
		@transactions = []
	end

	def add_item(item, price, quantity = nil)
		# binding.pry
		@transactions << [item, price, quantity]
		if quantity == nil
			@items << item
		else
			array = "#{item} " * quantity
			array.split.each do |item|
				@items << item
			end
		end
		# binding.pry
		if quantity == nil
			@total += price
		else
			@total += price * quantity 
		end
	end

	def apply_discount
		# binding.pry
		self.total = self.total - self.total* self.discount/100
		# binding.pry
		if self.discount == 0||nil
			"There is no discount to apply."
		else
			"After the discount, the total comes to $#{@total}."
		end
	end

	def transactions
		@transaction = []
	end


	def void_last_transaction
		# binding.pry
		last_trans = @transactions[-1]

		@total = self.add_item(last_trans[0], last_trans[1], last_trans[2]) - @total
		
	end


end

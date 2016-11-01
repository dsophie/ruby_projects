module Enumerable
	def my_each
		return self unless block_given?
		for element in self
			yield(element)
		end
	end

	def my_each_with_index
		return self unless block_given?
		index = 0
		for element in self
			yield(element, index)
			index = index + 1
		end
	end

	def my_select
		return self unless block_given?
		return_array = []
		self.my_each do |element| 
			if yield(element)
				return_array << element
			end
		end
		return return_array
	end

	def my_all
		return self unless block_given?
		boolean_return = false
		self.my_each do |element|
			if yield(element)
				boolean_return = true
			else
				boolean_return = false
			end
		end
		return boolean_return
	end

	def my_any
		return self unless block_given?
		self.my_each do |element|
			if yield(element)
				return true
			end
		end
	end

	def my_none
		return self unless block_given?
		count = 0
		self.my_each do |element|
			if yield(element) == false
				count = count + 1
			end
		end
		if self.length == count
			return true
		else
			return false
		end
	end

	def my_count
		count = 0
			if block_given? == true
				self.my_each do |element|
					if yield(element)
						count = count + 1
					end
				end
			elsif block_given? == false
				self.my_each do |element|
					count = count + 1
				end
			end
		return count
	end

	def my_map
		return self unless block_given?

		output = []
		self.my_each do |element|
			output << yield.call(element)
		end
		return output
	end

	def my_inject
	end

end

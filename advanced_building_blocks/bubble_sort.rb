# Bubble sort algorithm to sort an array

def bubble_sort(array)
	
	count = 0 #Number of passes during the algorithm	
	passes = array.length - 1 #Number of passes for the algorithm to work completly

	passes.times do
		array.each do |element|
			element_index = array.index(element)
			next_el = array[element_index+1]
		
			if next_el.nil?
				end_pass = true
			elsif element > next_el
				array[element_index], array[element_index+1] = array[element_index+1], array[element_index]
			end
		end
		count = count + 1
	end
	puts "#{array}" #Returns sorted array
end

test = [4, 3, 78, 2, 0, 2, 10, 20, 7]
bubble_sort(test)

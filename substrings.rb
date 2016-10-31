# Substrings method takes 2 arguments: a word/string to be tested and an array of valid substrings (dictionary)
# Returns a hash listing each substring, no matter the case, found in the orginal string and how many times it was found

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(entry, dictionary)
	result = {}
	entry = entry.downcase
	dictionary.each do |sub|
		count = 0
		entry.split(" ").each do |word|
			if word.include?(sub)
				count = count + 1
				result[sub] = count
			end
		end
	end
	
	puts "#{result}"
end

puts "Enter string to be converted (change dictionnary in file)"
text_input = gets.chomp
substrings(text_input, dictionary)

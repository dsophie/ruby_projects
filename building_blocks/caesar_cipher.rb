#Caesar cipher: substitution where each letter is replaced by a letter down a fixed number of letters in the alphabt
#Program should take in parameter/ ask for the string to cipher and the shift factor and then returns the encrypted string

def caesar_cipher(string, shift)

alphabet = 'a'..'z'
alphabet_cap = 'A'..'Z'
alphabet = alphabet.to_a
alphabet_cap = alphabet_cap.to_a

result = []

string.split("").each  do |letter|
	if alphabet.include?(letter) #lowercase letters
		i = alphabet.index(letter) #gets the index of the letter
		if (i + shift) < 26 
			i = i + shift
			le = alphabet[i] #gets the letter of the new index number
			result << le
		elsif (i + shift) > 26 #case when program need to go back to a
			over = (i + shift) - 26
			le = alphabet[over]
			result << le
		end
	elsif alphabet_cap.include?(letter) #uppercase letters
		i = alphabet_cap.index(letter) #gets the index of the letter
		if (i + shift) < 26 
			i = i + shift
			le = alphabet_cap[i] #gets the letter of the new index number
			result << le
		elsif (i + shift) > 26 #case when program need to go back to a
			over = (i + shift) - 26
			le = alphabet_cap[over]
			result << le
		end
	else #case of spaces and special characters
		result << letter
    end
end

str_result = ""

result.each do |letter|
	str_result = str_result + letter #change array into string
end
puts str_result

end

puts "Enter string to encrypt"
string = gets.chomp
puts "Enter shift for encryption"
shift = gets.chomp.to_i

caesar_cipher(string, shift)

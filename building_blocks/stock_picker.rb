# Takes in an array of stock prices, one for each day
# Return a pair of days representing the best day to buy and the best day to sell

def stock_picker(stocks)
	sell = stocks[0] #sell when it's expensive (highest number in array)
	buy = stocks[0] #buy when it's cheap (lowest number in array)
	stocks.each do |element|
		if element < buy
			buy = element
		elsif element > buy
			cache = 1
		end
		if element > sell
			sell = element
		elsif element < sell
			cache = 1
		end
	end

	index_buy = stocks.index(buy)
	index_sell = stocks.index(sell)
	result = [index_buy, index_sell]
	puts "#{result}"
end

puts "How many days of stock prices to you want to pick from?"
t = gets.chomp.to_i

list_stocks = []

puts "Please enter the each stock price one after the other"
t.times do
	list_stocks << gets.chomp.to_i
end

stock_picker(list_stocks)

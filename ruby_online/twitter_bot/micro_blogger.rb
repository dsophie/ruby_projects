require 'jumpstart_auth'
require 'bitly'

class MicroBlogger
    attr_reader :client

    def initialize
        puts "Initializing..."
        @client = JumpstartAuth.twitter #get authorization
    end
    
    def tweet(message)
        if message.length < 140
            @client.update(message)
        else
            puts "Warning: Over 140 characters"
        end
    end
    
    def dm(target, message)
        puts "Trying to send #{target} this direct message"
        puts message
        
        screen_names = @client.followers.collect { |follower| @client.user(follower).screen_name }
        message = "d @#{target} #{message}"
        
        if screen_names.include?(target) #if the target is following me, send
            tweet(message)
        else
            puts "Error, you can only DM people who follow you"
        end
        
    end
    
    def followers_list
        screen_names = []
        @client.followers.each do |follower|
            screen_names << @client.user(follower).screen_name
        end
        return screen_names
    end
    
    #Send a message to all your followers
    def spam_my_followers(message)
        followers = followers_list
        followers.each do |follower|
            dm(follower, message)
        end
    end
    
    #See the last tweet of everyone you follow
    def everyones_last_tweet
        friends = @client.friends
        friends.each do |friend|
            puts friend.screen_name
            puts friend.status.text
            puts " "
        end
    end
    
    #Shorten a URL using bitly
    def shorten(original_url)
        puts "Shortening this URL: #{original_url}"
        
        Bitly.use_api_version_3
        bitly = Bitly.new('hungryacademy', 'R_430e9f62250186d2612cca76eee2dbc6')
        return bitly.shorten(original_url).short_url
    end
    
    def run
        puts "Welcome to the JSL Twitter Client"
        command = ""
        while command != "q"
            printf "enter command "
            input = gets.chomp
            parts = input.split(" ")
            command = parts[0]
            
            case command
                when 'q' then puts "Goodbye!"
                when 't' then tweet(parts[1..-1].join(" "))
                when 'dm' then dm(parts[1], parts[2..-1].join(" "))
                when 'spam' then spam_my_followers(parts[0..-1].join(" "))
                when 'elt' then everyones_last_tweet
                when 's' then shorten(parts[1])
                when 'turl' then tweet(parts[1..-2].join(" ") + " " + shorten(parts[-1]))
                else
                    puts "Sorry, I don't know how to #{command}"
            end
        end
    end

end

blogger = MicroBlogger.new
blogger.run



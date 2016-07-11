day = 1
me = 'Ross Drew'
question = 1
puts "Seven Languages in Seven Weeks - Day #{day}, #{me}"

#1
puts "\nQuestion #{question}:"
question+=1
puts "Hello, World!"

#2
puts "\nQuestion #{question}:"
question+=1
index = 'Hello, Ruby,'.index('Ruby')
puts "The index of 'Ruby' in 'Hello, Ruby,' is #{index}"

#3
puts "\nQuestion #{question}:"
question+=1
count = 1
while count <= 10
 puts "#{count}.\t #{me}" 
 count += 1
end

#4
puts "\nQuestion #{question}:"
question+=1
count = 1
while count <= 10
  puts "This is sentance number #{count}"
  count += 1
end

#5 
puts "\nQuestion #{question}:"
question+=1
puts "This is running from a file"

#6 - Guess the number between 1 and 10
puts "\nQuestion #{question}:"
question+=1
number = rand(10)+1
guessed = false
puts "Guess the number (1-10)"
begin
  guess = gets().to_i

  if guess > number
  	puts "Lower..."
  elsif guess < number
  	puts "Higher..."
  elsif guess == number
    puts "You got it, #{number}"
    guessed = true
  end

end until guessed
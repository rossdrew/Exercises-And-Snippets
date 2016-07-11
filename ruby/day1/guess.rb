#Question VI

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
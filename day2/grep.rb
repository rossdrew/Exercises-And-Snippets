# Question IV
# Edit so that it accepts command line arguments for 'phrase' and filename
phrase = "Four"
File.open("testSearchFile.txt") do |f1|
  line_number = 1
  while line = f1.gets
    #Can be done with regexp
    puts "#{line_number} : '#{line}'".delete("\n") if /#{phrase}/.match(line)
    #Or without it
    puts "#{line_number} : '#{line}'".delete("\n") if line[phrase]
    
    line_number += 1
  end
end
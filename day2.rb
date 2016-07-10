day = 2
me = 'Ross Drew'
question = 1
puts "Seven Languages in Seven Weeks - Day #{day}, #{me}"

#a.1 
filename = 'testFile.txt'
puts "Writing to file '#{filename}' without block"
f1 = File.open(filename, 'w')
f1 << "These are the test file contents\nThis is the second line"
f1.close()

#a.2
puts "Reading from file '#{filename}' with block"
File.open(filename) do |f1|
	while line = f1.gets
		puts "'#{line}'".delete("\n")
	end
end

my_hash = {'forename' => 'Ross', 'middlename' => 'William', 'surname' => 'Drew'}
#b.1 translate hash to array (or array of arrays)
puts 'Hash to Array...'
p my_hash.to_a #2D
p my_hash.to_a.flatten #1D

#b.2 translate array to hash?
my_array = [["forename", "Ross"], ["middlename", "William"], ["surname", "Drew"]]
puts 'Array to Hash...'
p my_array.to_h

#b.3 iterate over hash
puts 'Iterate over Hash...'
my_hash.each do |key, value|
  puts "#{key} => #{value}"
end

#b.4 what data structures can an array be treated as
puts '_Stack_'
my_array = ['Ross','William','Drew']
p my_array.push("Esquire")
p my_array.push("The Third")
my_array.pop
my_array.pop
p my_array

puts '_Queue_'
my_array = ['Ross','William','Drew']
p my_array.unshift("The Great")
my_array.shift
p my_array

puts '_Cyclic Queue'
my_array = [1,2,3,4,5]
p my_array.rotate()
p my_array.rotate(0)

#1.a
puts "\nQuestion #{question}:"
puts "(a)"
question+=1
numbers = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
i = 0
numbers.each do |item|
  #p prints the value of .inspect rather than .to_s
  p numbers[i, 4] if(i % 4 == 0)
  i +=1
end

#1.b
puts "(b)"
#p prints the value of .inspect rather than .to_s
numbers.each_slice(4) {|i| p i}

#2 Initialise with nested hash structure
puts "\nQuestion #{question}:"
question+=1

class Tree
  attr_accessor :children, :node_name
  
  #Old method
  # def initialize(name, children=[])
  #   @children = children
  #   @node_name = name
  # end

 #I assume this is always a single root node based tree?
  def initialize(family_tree={})
    @node_name = family_tree.keys[0]
    @children = []
    parent_value = family_tree[node_name]

    if not parent_value.nil? and not parent_value.empty?
      parent_value.each do |child_value, child_key|
        child_hash = {child_value => child_key}
        @children.push(Tree.new(child_hash))
      end
    end
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

family = 
{'grandpa' => {
			   'dad' => {
 						 'child1' => {},
 						 'child2' => {}
			            },
			   'uncle' => {
			   			   'child3' => {},
			   			   'child4' => {}
			   			  }
              }
}

my_tree = Tree.new (family)
p my_tree

puts "Visiting a node"
my_tree.visit {|node| puts node.node_name}
 
puts "visiting entire tree"
my_tree.visit_all {|node| puts node.node_name}

#3 A grep that prints out the line numbers of a file that a phrase appears on
puts "\nQuestion #{question}:"
question+=1

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

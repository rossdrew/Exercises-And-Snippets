# Question III

class Tree
  attr_accessor :children, :node_name
  
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end
  
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

#  A Tree structure that allows the entire tree 
# structure to be specified as a hashmap on 
# initialization
# I assume this is always a single root node based tree?
class ExtendedTree < Tree
  def initialize(family_tree={})
    @node_name = family_tree.keys[0]
    @children = []
    parent_value = family_tree[node_name]

    #There's probably a prettier way to do this in Ruby
    if not parent_value.nil? and not parent_value.empty?
      parent_value.each do |child_value, child_key|
        child_hash = {child_value => child_key}
        @children.push(ExtendedTree.new(child_hash))
      end
    end
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

my_tree = ExtendedTree.new (family)
p my_tree

puts "Visiting a node"
my_tree.visit {|node| puts node.node_name}
 
puts "visiting entire tree"
my_tree.visit_all {|node| puts node.node_name}

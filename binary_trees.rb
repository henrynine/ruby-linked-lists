class Node
  attr_reader :value
  attr_accessor :parent, :left_child, :right_child

  def initialize(value, parent = nil, left_child = nil, right_child = nil)
    @value = value
    @parent = parent
    @left_child = left_child
    @right_child = right_child
  end
end

class BinaryTree

  attr_reader :head

  def initialize(head_value)
    @head = Node.new(head_value)
  end

  def insert insert_node
    compare_node = @head
    #puts "@head: #{@head}"
    #puts "compare_node: #{compare_node}"
    loop do
      return false if compare_node.value == insert_node.value
      #puts "head went through" if @head == compare_node

      if insert_node.value < compare_node.value
        if compare_node.left_child.nil?
          compare_node.left_child = insert_node
          insert_node.parent = compare_node
        else
          compare_node = compare_node.left_child
        end
      end

      if insert_node.value > compare_node.value
        if compare_node.right_child.nil?
          compare_node.right_child = insert_node
          insert_node.parent = compare_node
        else
          compare_node = compare_node.right_child
        end
      end
    end
    self
  end

  def insert_value value
    insert_node = Node.new(value)
    self.insert insert_node
  end

  def to_s
    puts "binary tree"
  end
end

def build_tree_from_unsorted list#ideally list contains unqiue values
  list.shuffle!
  tree = BinaryTree.new(list.shift)
  puts "made tree: #{tree}"
  puts "head: #{tree.head}"
  list.length.times do
    tree.insert_value list.shift
  end
  tree
end

def build_tree_from_sorted list#must be unique
  puts "building from sorted: #{list}"

  #base case
  return BinaryTree.new(list[0]) if list.length == 1

  #recurse
  tree = BinaryTree.new(list[list.length/2])
  list.delete list[list.length/2]
  tree.insert (build_tree_from_sorted list[0..(list.length/2-1)]).head
  tree.insert (build_tree_from_sorted list[(list.length/2)..-1]).head

  return tree
end

# There are many ways to implement these methods, feel free to add arguments 
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_reader :root
  def initialize
    @root = nil
  end

  # my solution is not recursive
  def insert(value)
    new_node = BSTNode.new(value)
    return @root = new_node if @root.nil?
    current = @root
    until ((value > current.value && current.right.nil?) || 
          (value < current.value && current.left.nil?) || 
          (value == current.value)) 
      current = (value > current.value) ? current.right : current.left
    end

    new_node.parent = current
    if value > current.value 
       current.right = new_node 
       new_node.direction = 'right'
    elsif value < current.value
        current.left = new_node
        new_node.direction = 'left'
    else 
      # pick an empty side if the values are the same for more balance, this makes finding harder
      # return current.left = new_node if current.left.nil?
      # return current.right = new_node if current.right.nil?

      # if no empty side then just pick the left side,push down what is already there
      new_node.left = current.left
      current.left = new_node
      new_node.direction = 'left'
    end
    new_node
  end

  # recursive
  def find(value, tree_node = @root)
    # base case
    if (value > tree_node.value && tree_node.right.nil?) || 
       (value < tree_node.value && tree_node.left.nil?) || 
       (tree_node.nil?)
      return nil
    elsif value == tree_node.value
      return tree_node
    end

    returnV = (value <= tree_node.value) ? find(value, tree_node.left) : find(value, tree_node.right)
  end

  def delete(value)
    node = find(value, @root) 
    return @root = nil if node == @root
    return nil if node.nil?

    if node.left.nil? && node.right.nil? 
      node.direction == 'left' ? node.parent.left = nil : node.parent.right = nil
    elsif node.left
      # if there is a left side then get the highest of the left side to replace the spot
      node_to_swap_with = maximum(node.left)
      node_to_swap_with.direction == 'left' ? node_to_swap_with.parent.left = nil : node_to_swap_with.parent.right = nil 
      parent = node.parent
      if node.direction == 'left' 
        parent.left = node_to_swap_with
        # another implementation:
        # current = node_to_swap_with
        # while current.left
        #   current = current.left
        # end
        # current.left = node.left
        # node.left.parent = current
        og_left = node_to_swap_with.left
        node_to_swap_with.left  = node.left 
        node.left.right = og_left
      else 
        parent.right = node_to_swap_with
      end 
      node_to_swap_with.parent = parent
    elsif node.left.nil? && node.right  # this part might not be completely accurate
      # get the lowest of the right side if only right side exists
      node_to_swap_with = minimum(node.right)
      node_to_swap_with.direction == 'left' ? node_to_swap_with.parent.left = nil : node_to_swap_with.parent.right = nil 
      parent = node.parent
      if node.direction == 'left' 
        parent.left = node_to_swap_with
      else 
        parent.right = node_to_swap_with
      end 
      node_to_swap_with.parent = parent
    end
  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    current = tree_node
    return nil if current.nil?
    until current.right.nil?
      current = current.right
    end
    current
  end

  def minimum(tree_node = @root)
    current = tree_node
    return nil if current.nil?
    until current.left.nil?
      current = current.left
    end
    current
  end

  def depth(tree_node = @root)
    return 0 if tree_node.nil? || (tree_node.left.nil? && tree_node.right.nil?)
    1 + [depth(tree_node.left), depth(tree_node.right)].max
  end 

  def is_balanced?(tree_node = @root)
    return true if !tree_node
    return false if (depth(tree_node.left) - depth(tree_node.right)).abs > 1
    # check if depth of each side is less than one
    [is_balanced?(tree_node.left), is_balanced?(tree_node.right)].all?

  end

  def in_order_traversal(tree_node = @root, arr = [])
    in_order_traversal(tree_node.left, arr) if tree_node.left
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr) if tree_node.right
    arr
  end

  def self.node_count(node=@root)
    return 0 if node.nil?
    1 + node_count(node.left) + node_count(node.right)
  end
  
  private
  # optional helper methods go here:

end

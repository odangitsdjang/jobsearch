require_relative 'binary_search_tree'
# [1,2,3,4,5], [2]
def kth_largest(tree_node, k)

  if BinarySearchTree.node_count(tree_node.right) == k-1
    return tree_node
  elsif BinarySearchTree.node_count(tree_node.right) >= k
    return kth_largest(tree_node.right, k)
  else
    return kth_largest(tree_node.left, k - BinarySearchTree.node_count(tree_node.right) - 1)
  end
end

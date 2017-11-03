# Given a binary tree and a sum, 
# find all root-to-leaf paths where each path's sum equals the given sum.

# medium - path sum 2
#  not correct!!!!!!
def path_sum(root, sum)
  # base case
  return [[]] if root.nil? || root.val > sum 
  return [[root.val]] if root.val == sum

  left = path_sum(root.left, sum-root.val)
  right = path_sum(root.right, sum-root.val)

  left.each {|arr| arr.unshift(root.val) unless arr.empty? }
  right.each {|arr| arr.unshift(root.val) unless arr.empty? }

  left.concat(right).delete_if {|arr| arr.empty? }
end
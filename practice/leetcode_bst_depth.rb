leetcode_bst_depth - easy

def max_depth(root)
    return 0 if root.nil?
    return 1 if (root.left.nil? && root.right.nil?)
    left = max_depth(root.left)
    right = max_depth(root.right)
    left > right ? left+1 : right+1
end
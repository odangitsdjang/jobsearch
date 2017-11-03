# 62. Unique Paths

# A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
# The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
# How many possible unique paths are there?

# draw out a matrix to see that it is a dynamic programming problem. 
def unique_paths(m,n)
  matrix = Array.new(m) { Array.new(n) }
  
  matrix.each_with_index do |row, i| 
    row.each_index do |j|
      if i == 0 || j == 0 
        matrix[i][j] = 1
      else 
        matrix[i][j] = matrix[i-1][j] + matrix[i][j-1]
      end
    end
  end
  matrix[m-1][n-1]
end

unique_paths(3,3)
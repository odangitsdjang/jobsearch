# Determine if a Sudoku is valid, according to: Sudoku Puzzles - The Rules.

# The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
# A partially filled sudoku which is valid.

def is_valid_sudoku(board)
  #row
  board.each do |row|
    return false unless valid?(row)
  end

  # column
  (0..8).each do |row_idx|
    tmp = []
    (0..8).each do |col_idx|
      tmp.push(board[col_idx][row_idx])
    end
    return false unless valid?(tmp)
  end

  i = 0 
  3.times do
    j = 0
    3.times do
      tmp = []
      (0..2).each do |k|
        (0..2).each do |l| 
          tmp.push(board[i+k][l+j])
        end
      end
      return false unless valid?(tmp)
      j += 3
    end
    i += 3
  end
  true
end


def valid?(arr)
  no_dot = arr.select {|ch| ch != '.' }
  return false if no_dot != no_dot.uniq
  no_dot.all? {|num| return false if num.to_i > 9 && num.to_i < 0 }
  true
end
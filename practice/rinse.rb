# Given a list of schedules, provide a list of times that 
# are available for a meeting:

# Example input (busy times):
# [
#   [[4,5],[6,10],[12,14]],
#   [[4,9],[13,16]],
#   [[11,14]]
# ]

# Example Output (free times):
# [[0,4],[10, 11],[16,24]]

def free_times(arr)
  ans = []
  free = Hash.new {|h,k| h[k] = true}
  arr.each do |person_arr|
    person_arr.each do |arr|
      (arr[0]..arr[1]).each do |n|
        free[n] = false if arr[1] >= n+1
      end
    end
  end
  # [4, 5, 6, 7, 8, 9, 11, 12, 13, 14, 15]
  current = 0
  free.keys.sort.each_with_index do |v, i| 
    if i == 0 
      ans.push([current, v])
      current = v
      next
    elsif i == free.keys.length-1 && v < 23 
      ans.push([v+1, 24])
    end

    if v == current + 1 
      current = v
    else 
      ans.push([current+1, v])
      current = v
    end
  end
  ans

end

free_times(
  [
  [[4,5],[6,10],[12,14]],
  [[4,9],[13,16]],
  [[11,14]]
]
)
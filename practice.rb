# dynamic programming practice

# longest increasing subsequence using dynamic programming
# [1, 5, 2, 6, 10, 4, 20] => [1,2,6,10,20]
# Approach is to find the best subsolution at each index starting from the front
# While going through the next index find which one uses the one that is the longest length that ends with the value less than the current index


def LIS(arr)
  longest = Array.new(arr.size) { Array.new }
  longest[0] << arr[0]
  (1...arr.size).each do |i|
    (0...i).each do |j|
      if arr[j] < arr[i] && longest[i].size < longest[j].size + 1 
        longest[i] = longest[j].dup
      end
    end
    longest[i] << arr[i]
  end
  longest.max_by(&:length).length

end
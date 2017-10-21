class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.

  def self.sort1(array)
    return array if length <= 1
    pivot = array[0]
    left = self.sort1(array.select{|el| el < pivot })
    right = self.sort1(array.select{|el| el >= pivot})

    return left + [pivot] + right

  end

  # [1 2 3 4 5 6], [1,2,3]
  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return if length <= 1
    pivot = self.partition(array, start, length, &prc)
    left_length = pivot - start
    right_length = length - (left_length + 1)

    self.sort2!(array, start, left_length)
    self.sort2!(array, pivot+1, right_length)
  end

  # [5,3,4,2,1,6] , 0 , 6 
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|el1, el2| el1<=> el2 }
    pivot = array[start]
    barrier = start
    (start+1..start+length-1).each do |n|
      if prc.call(pivot, array[n]) > 0
        
        barrier += 1
        array[barrier], array[n] = array[n], array[barrier]
      end
    end
    tmp = array[barrier]
    array[barrier] = array[start]
    array[start] = tmp
    # pivot, array[barrier] = array[barrier], pivot
    barrier
  end
end

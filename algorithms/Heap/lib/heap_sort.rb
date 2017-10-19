require_relative "heap"

class Array
  def heap_sort!
    heap = BinaryMinHeap.new
    self.each { |num| heap.push(num) }
    heap.count.times do |idx|
      self[idx] = heap.extract
    end
    self
  end
end

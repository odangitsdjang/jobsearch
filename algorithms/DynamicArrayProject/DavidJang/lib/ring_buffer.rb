require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @store = []
    @length = 0
    @capacity = 8
    @start_idx = 0
  end

  # O(1)
  # [nil, nil, 0, 1, 2, 3, 4, nil] -> start_idx: 2, length: 5
  def [](index)
     if index >= @length
      raise "index out of bounds"
    else 
      self.store[(@start_idx + index) % @capacity]
    end
  end

  # O(1)
  def []=(index, val)
    if index >= @length
      raise "index out of bounds"
    else 
      self.store[(@start_idx + index) % @capacity] = val
    end
  end

  # O(1)
  def pop
    if @length > 0 
      tmp = self.store[(@start_idx + @length - 1) % @capacity]
      self.store[(@start_idx + @length - 1) % @capacity] = nil
      @length -= 1
      tmp
    else 
      raise "index out of bounds"
    end
  end

  # O(1) ammortized
  # [nil,1,2,3], start_idx: 1, length: 3, capacity 4
  # [1, nil, 2,3] start:2, length: 3, capacity: 4
  def push(val)
    if @length >= @capacity
      tmp = @store[@start_idx..-1] + @store[0...@start_idx]
      @store = tmp + Array.new(@capacity)
      @start_idx = 0
      @store[@capacity] = val
      @length += 1 
      @capacity *= 2
    else 
      @store[(@start_idx+@length)% @capacity] = val
      @length += 1 
    end
  end

  # O(1)
  # [1, nil, nil, 2,3,4,5], start_idx: 3, length: 5
  def shift
    if @length > 0 
      tmp = @store[@start_idx]
      @store[@start_idx] = nil
      @start_idx = (@start_idx + 1) % @capacity
      @length -= 1
      tmp
    else 
      raise "index out of bounds"
    end
  end

  # O(1) ammortized
  # [1,2,3,4,5,6,7,8] 
  # [1,2,3,4,5,6,7, nil] , [ nil, nil, nil, 2,3,4,5,6]
  def unshift(val)
    
    if @length >= @capacity 
      tmp = @store[@start_idx..-1] + @store[0...@start_idx]
      @store = [val] + tmp + Array.new(@capacity-1)
      @start_idx = 0
      @length += 1 
      @capacity *= 2
    else 
      @store[(@start_idx-1)% @capacity] = val
      @start_idx = (@start_idx-1) % @capacity
      @length += 1 
    end
  end

  def max 
    @store.map(&:to_i).max
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end


  def resize!
    
  end
end

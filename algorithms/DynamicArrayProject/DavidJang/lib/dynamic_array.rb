require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @store = []
    @length = 0
    @capacity = 8
  end

  # O(1)
  def [](index)
    if index >= @length
      raise "index out of bounds"
    else 
      self.store[index]
    end
  end

  # O(1)
  def []=(index, value)
    if index >= @length
      raise "index out of bounds"
    else 
      self.store[index] = value
    end
  end

  # O(1)
  def pop
    if @length > 0 
      
      tmp = self.store[@length-1]
      self.store[@length-1] = nil
      @length -= 1
      tmp
    else 
      raise "index out of bounds"
    end
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length >= @capacity
      @store += Array.new(@capacity)
      @capacity *= 2 
    end
    @store.push(val)
    @length += 1 

  end

  # O(n): has to shift over all the elements.
  def shift
    if @length > 0 
      @store = @store[1..-1]
      @length -= 1
    else 
      raise "index out of bounds"
    end

  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @length >= @capacity 
      @store += Array.new(@capacity)
      @capacity *= 2 
    end
    @store[1..@length+1] = @store[0..@length]
    @length+=1
    @store[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end

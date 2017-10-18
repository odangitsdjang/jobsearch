class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = true
    end
  end

  def remove(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else
      @store[num] = false
    end
  end

  def include?(num)
    if num > @store.length || num < 0
      raise "Out of bounds"
    else 
      @store[num]
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end
  
  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num%20]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @store.length == @count 
      resize!
    end
    @count+=1
    self[num].push(num)

  end

  def remove(num)
    self[num].delete(num)
    @count-=1
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old = @store.dup
    @store = Array.new(2*@store.length) { Array.new }
    @count = 0
    old.each {|arr| arr.each {|el| self.insert(el) }  }
  end
end

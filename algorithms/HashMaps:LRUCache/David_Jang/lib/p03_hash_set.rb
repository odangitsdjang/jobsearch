require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.include?(key)
      return false
    else
       self[key.hash].push(key)
       @count += 1 
       resize! if @count > @store.length
       key
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key) 
      self[key.hash].delete(key)
    else
    end
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

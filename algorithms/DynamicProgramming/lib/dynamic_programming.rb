class DynamicProgramming

  def initialize
    @blair_cache = {1=>1, 2=> 2}
  end

  def blair_nums(n)
    return @blair_cache[n] if @blair_cache[n]
    @blair_cache[n] = blair_nums(n-1) + blair_nums(n-2) + odd_number(n-1)
  end
  
  def frog_hops_bottom_up(n)
    c = frog_cache_builder(n)
    c[n]
  end

  def frog_cache_builder(n)
    cache = {1 =>[[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]] }
    return cache[n] if n <= 3
    (4..n).each do |i|
      current = cache[i-1].dup
      cache[i].each do |arr|
        
      end
    end
  end

  def frog_hops_top_down(n)

  end

  def frog_hops_top_down_helper(n)

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end

  def odd_number(n)
    n * 2 - 1 
  end
  
end

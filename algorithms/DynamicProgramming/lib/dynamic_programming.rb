class DynamicProgramming

  def initialize
    @blair_cache = {1=>1, 2=> 2}
    @frog_cache = { 1 =>[[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]] }
    @super_frog_cache = { 1 => [[1]] }
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
    #        [1,1,1,1], [1,2,1], [2,1,1], [3,1]
    # 4 => [ [1,1,1,1], [1,2,1], [1,1,2], [2,1,1], [2,2], [1,3], [3,1] ]  +3
    #        [1,1,1,1,1], [1,2,1,1], [1,1,2,1], [2,1,1,1] 
    # 5 => [ [1,1,1,1,1], [1,2,1,1], [1,1,2,1], [1,1,1,2], [2,1,1,1], [1,3,1], [1,1,3], [3,1,1]  ] +2
    cache = { 1 =>[[1]], 2 => [[1,1], [2]], 3 => [[1,1,1], [1,2], [2,1], [3]] }
    (4..n).each do |i|
      current = []
      cache[i - 3].each do |prev_route|
        cache[3].each do |base_route|
          possible = prev_route + base_route
          current << possible unless current.include?(possible)
        end
      end
      cache[i - 2].each do |prev_route|
        cache[2].each do |base_route|
          possible = prev_route + base_route
          current << possible unless current.include?(possible)
        end
      end
      cache[i - 1].each do |prev_route|
        cache[1].each do |base_route|
          possible = prev_route + base_route
          current << possible unless current.include?(possible)
        end
      end
      cache[i] = current
    end
    cache
  end

  def frog_hops_top_down(n)
    return @frog_cache[n] if @frog_cache[n]
    frog_hops_top_down_helper(n)
  end

  def frog_hops_top_down_helper(n)
    current = []
    frog_hops_top_down(n - 3).each do |prev_route|
      @frog_cache[3].each do |base_route|
        possible = prev_route + base_route
        current << possible unless current.include?(possible)
      end
    end
    frog_hops_top_down(n - 2).each do |prev_route|
      @frog_cache[2].each do |base_route|
        possible = prev_route + base_route
        current << possible unless current.include?(possible)
      end
    end
    frog_hops_top_down(n - 1).each do |prev_route|
      @frog_cache[1].each do |base_route|
        possible = prev_route + base_route
        current << possible unless current.include?(possible)
      end
    end
    @frog_cache[n] = current
  end

  def super_frog_hops(n, k)

    dyn_cache = { 1 => [[1]]}
    dyn_cache = dynamic_cache(n, dyn_cache)
      if k > n
        return dyn_cache[n]
      else
        ((k+1)..n).each do |num3|
          current = []
          (1..k).each do |num4|
            dyn_cache[num3 - num4].each do |prev_route|
              dyn_cache[num4].each do |base_route|
                current << prev_route + base_route unless current.include?(prev_route + base_route)
              end
            end
          end
          dyn_cache[num3] = current
        end
      end
      dyn_cache[n]
  end

    def dynamic_cache(n, dyn_cache)
    (2..n).each do |num|
      current = []
      (1..num - 1).each do |num2|
        dyn_cache[num2].each do |prev_route|
          dyn_cache[num - num2].each do |base_route|
            current << prev_route + base_route unless current.include?(prev_route + base_route)
          end
        end
      end
      dyn_cache[num] = current + [[num]]
    end
    return dyn_cache
  end

  def knapsack(weights, values, capacity)
    table = knapsack_table(weights, values, capacity)
    table[weights.length][capacity]
  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)
    num_items = weights.length
    weight_val_hash = {}
    (1..num_items).each do |i|
      weight_val_hash[i] = [weights[i - 1], values[i - 1]]
    end
    table = Array.new(num_items + 1) { Array.new(capacity + 1)}
    table[0].each_index do |idx|
      table[0][idx] = 0
    end
    (1..num_items).each do |i|
      weight, value = weight_val_hash[i]
      (0..capacity).each do |j|
        if weight > j
          table[i][j] = table[i-1][j]
        else
          table[i][j] = [table[i-1][j], table[i-1][j - weight] + value].max
        end
      end
    end
    return table
  end

  def maze_solver(maze, start_pos, end_pos)
  end

  def odd_number(n)
    n * 2 - 1 
  end
  
end

module PayoutHelper
  
  def get_coins(coin_set_id)
    coin_set = CoinSet.find(coin_set_id)
    coin_set ? coin_set.coins : []
  end

  # Bottom-up approach
  def make_change_(a, list = [25, 10, 5, 1])
    return nil if a < 0
    return nil if a != a.floor

    parents = Array.new(a + 1)
    parents[0] = 0
    worklist = [[0, 0]]
    while parents[a].nil? && !worklist.empty? do
      base, starting_index = worklist.shift
      starting_index.upto(list.size - 1) do |index|
        coin = list[index]
        tot = base + coin
        if tot <= a && parents[tot].nil?
          parents[tot] = base
          worklist << [tot, index]
        end
      end
    end

    return nil if parents[a].nil?
    result = []
    while a > 0 do
      parent = parents[a]
      result << a - parent
      a = parent
    end
    result.sort!.reverse!
   end

end

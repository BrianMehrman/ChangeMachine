module CoinSetsHelper
  def get_coin_sets
    CoinSet.all.collect { |cset| [cset.name,cset.id]}
  end

end

class PayoutsController < ApplicationController
  helper_method :make_change #PayoutHelper
  
  # Memorization
  def make_change(amount, coins = [25, 10, 5, 1])
      coins.sort! { |a, b| b <=> a }

      # memoize solutions
      optimal_change = Hash.new do |hash, key|
      
        hash[key] = if key < coins.min
           # the amount is less than our smallest coin, so you get no change
          []
        elsif coins.include?(key)
          [key]
        else
          coins.
            # prune unhelpful coins
            reject { |coin| coin > key }.

            # prune coins that are factors of larger coins
            inject([]) {|mem, var| mem.any? {|c| c%var == 0} ? mem : mem+[var]}.

            # recurse
            map { |coin| [coin] + hash[key - coin] }.

            # prune unhelpful solutions
            reject { |change| change.inject(0) {|s,v| s += v } != key }.

            # pick the smallest, empty if none
            min { |a, b| a.size <=> b.size } || []
        end
      end

      optimal_change[amount]
  end
  
  
  def index
    
  end

  def new
  end

  def create
    
    @coin_set = CoinSet.find(params[:coin_set_id])
    @amount = params[:value].to_i
    @coins = @coin_set.coins or []
    @coins.sort! {|a,b| a.value <=> b.value}
    @coin_hash = Hash[*@coins.collect{ |coin| [coin.value,coin] }.flatten]
    puts @coin_hash
    @payout = make_change( @amount, @coin_hash.keys ).collect { |coin| @coin_hash[coin]}
    
    respond_to do |format|
      format.js
      format.html { redirect_to root_path, notice: 'Change has been processed.' }
    end
  end

  def get_coin_set
    @coin_set = CoinSet.find(params[:coin_set])
    
    respond_to do |format|
      format.js
    end
  end

end

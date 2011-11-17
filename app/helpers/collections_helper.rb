module CollectionsHelper
  def get_collection(coin_set, coin)
    collection = Collection.find(:first, :conditions => ["coin_set_id = ? AND coin_id = ?", coin_set.id,coin.id])
  end
end
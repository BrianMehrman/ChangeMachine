class CoinSet < ActiveRecord::Base
  has_many :collections
  has_many :coins, :through => :collections
  
  validates :name, :uniqueness => true, :presence => true

end

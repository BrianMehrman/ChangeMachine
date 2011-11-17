class Coin < ActiveRecord::Base
  
  has_many :collections
  has_many :coin_sets, :through => :collections
  
  validates_uniqueness_of :name
  validates_presence_of :value, :name
  
end

class Collection < ActiveRecord::Base
  belongs_to :coin
  belongs_to :coin_set
  
  validates_uniqueness_of :coin_set_id , :scope => :coin_id
end

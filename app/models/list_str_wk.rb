class ListStrWk < ActiveRecord::Base
  has_many :matrix_items
    
   FEATURE_TYPES = [
    [ "Stongness",   "Stongness" ],
    [ "Weakness",    "Weakness" ]
  ]
  
end

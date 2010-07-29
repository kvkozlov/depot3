class ListOppTr < ActiveRecord::Base
  has_many :matrix_items
  EVENT_TYPES = [
    [ "Opportunity",          "Opportunity" ],
    [ "Treat",    "Treat" ]
  ]
  
end

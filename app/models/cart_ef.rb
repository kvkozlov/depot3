class CartEf
  attr_reader :item_ots,:item_sws
  
  
  def initialize
    @item_ots=[]
    @item_sws=[]
  end
  
  
  
  
  def add_str_wk(list_str_wk)
     current_item = @item_sws.find {|item_ot| item_ot.list_str_wk == list_str_wk}
    if current_item
      current_item.increment_quantity
    else
      current_item=CartEfItem.new(list_str_wk)
      @item_sws << current_item
    end      
    current_item
  end 
  
   def add_opp_tr(list_opp_tr)
    current_item = @item_ots.find {|item_sw| item_sw.list_str_wk == list_opp_tr }    
     if current_item
      current_item.increment_quantity
    else
      current_item=CartEfItem.new(list_opp_tr)
      @item_ots << current_item
    end
    current_item
  end 
  
end
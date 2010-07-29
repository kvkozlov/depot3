class CartEfItem
  attr_reader :list_opp_tr, :list_str_wk, :quantity
  
  
  
   def initialize(list_str_wk)
       @list_str_wk = list_str_wk
       @list_opp_tr=nil
     
    @quantity = 1
  end
  
  def increment_quantity
    @quantity += 1
  end

  def name
    if @list_opp_tr!=nil
      @list_opp_tr.name
    end
    
      if @list_str_wk!=nil
        @list_str_wk.name
      end
    
  end

end
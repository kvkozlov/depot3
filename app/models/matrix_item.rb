class MatrixItem < ActiveRecord::Base
  belongs_to :swot
  belongs_to :list_opp_tr
  belongs_to :list_str_wk
  
  def self.from_cart_ef_items(item_ot,item_sw,x,y)
    li=self.new
    li.list_opp_tr=item_ot.list_str_wk
    li.list_str_wk=item_sw.list_str_wk
    li.x=x
    li.y=y
    li.value=rand(6).to_f
    li
  end
  
  def yy
    self.y
  end
  
protected  
  def self.find_items_to_show
     find(:all,:order=>"x")
  end

end

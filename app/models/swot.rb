class Swot < ActiveRecord::Base
  has_many :matrix_items
  
  def add_matrix_items_from_cart_ef(cart_ef)
    @x=0
    @y=0
    cart_ef.item_sws.each do |item_sw|
      @x=0
      cart_ef.item_ots.each do |item_ot|
        li=MatrixItem.from_cart_ef_items(item_ot,item_sw,@x,@y)
        matrix_items<<li
        @x+=1
      end
      @y+=1
    end
  end
protected  
  def self.find_swots_to_show
     find(:all,:order=>"name")
  end
  
end

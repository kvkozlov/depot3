class SwotController < ApplicationController
  
  def index
    @swots=Swot.find_swots_to_show
    @cart_ef=find_cart_ef
    @matrix_items=MatrixItem.find_items_to_show
  end

  def edit_matrix
    @matrix_items=MatrixItem.find_items_to_show
    @swot = Swot.find(params[:id])
  end
  
  def update_matrix
     @matrix_items=MatrixItem.find_items_to_show
      @swot = Swot.find(params[:id])
     redirect_to :action=>:index
 end
 
 def generate_scenario
      @swot = Swot.find(params[:id])
      @matrix_items=MatrixItem.find_items_to_show.find_all{|item| item.swot==@swot}
     # redirect_to :action => :index
      flash[:notice]=@matrix_items.size.to_s
      @n=MatrixItem.find_items_to_show.find_all{|item| item.swot==@swot}.find_all{|item| item.x==0}.size
      flash[:notice]=flash[:notice]+" "+@n.to_s+"  "
    
       
       @b=[]
       @po=2**(@n-1)
       (1..@po).each do |m|
         @a=[]
         (@n-1).downto(0) do |k|
           @a << m[k]   
         end
         @b << @a
       end
        
       @mt=[]
       
       for mat_itemm in @matrix_items.find_all{|item| item.swot==@swot}.find_all{|item| item.y==0}
         @t=[]
          for mat_itemmm in @matrix_items.find_all{|item| item.swot==@swot}.find_all{|item| (item.x==mat_itemm.x)&&(item.list_opp_tr.name==mat_itemm.list_opp_tr.name)}
            @t<<mat_itemmm.value
        end
        @mt<<@t
       end
       
       @scens=[]
       
       @b.each do |l|
         @t=[]
         
         @mt.each do |h|  
          @po=h.size-1
          @sum=0.0
          (0..@po).each do |m|
            flash[:notice]=flash[:notice]+"\n"+m.to_s
             @sum=@sum+l[m]*h[m]
          end
          @t<<@sum
         end
         
         @scens<<@t
       end       
    
       @mt.each do |l|
        flash[:notice]=flash[:notice]+"\n"+l.to_s
       end
 end

private

  def find_cart_ef
    session[:cart_ef] ||= CartEf.new
  end  
end

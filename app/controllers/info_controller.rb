class InfoController < ApplicationController
  
  def swot_info
    @swot = Swot.find(params[:id])
    @matrix_items=MatrixItem.find_items_to_show.find_all{|item| item.swot==@swot} 
    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
  
protected
  
  def authorize
  end
    
end

class ListOppTrsController < ApplicationController
  # GET /list_opp_trs
  # GET /list_opp_trs.xml
  def index
    @list_opp_trs = ListOppTr.find(:all,:order => "name")
    @cart_ef=find_cart_ef
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @list_opp_trs }
    end
  end

  # GET /list_opp_trs/1
  # GET /list_opp_trs/1.xml
  def show
    @list_opp_tr = ListOppTr.find(params[:id])
    @cart_ef=find_cart_ef
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_opp_tr }
    end
  end

  # GET /list_opp_trs/new
  # GET /list_opp_trs/new.xml
  def new
    @list_opp_tr = ListOppTr.new
    @cart_ef=find_cart_ef
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list_opp_tr }
    end
  end

  # GET /list_opp_trs/1/edit
  def edit
    @list_opp_tr = ListOppTr.find(params[:id])
    @cart_ef=find_cart_ef
  end

  # POST /list_opp_trs
  # POST /list_opp_trs.xml
  def create
    @list_opp_tr = ListOppTr.new(params[:list_opp_tr])
    @cart_ef=find_cart_ef

    respond_to do |format|
      if @list_opp_tr.save
        flash[:notice] = 'ListOppTr was successfully created.'
        format.html { redirect_to(@list_opp_tr) }
        format.xml  { render :xml => @list_opp_tr, :status => :created, :location => @list_opp_tr }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_opp_tr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_opp_trs/1
  # PUT /list_opp_trs/1.xml
  def update
    @list_opp_tr = ListOppTr.find(params[:id])
    @cart_ef=find_cart_ef

    respond_to do |format|
      if @list_opp_tr.update_attributes(params[:list_opp_tr])
        flash[:notice] = 'ListOppTr was successfully updated.'
        format.html { redirect_to(@list_opp_tr) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_opp_tr.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_opp_trs/1
  # DELETE /list_opp_trs/1.xml
  def destroy
    @list_opp_tr = ListOppTr.find(params[:id])
    @list_opp_tr.destroy
    @cart_ef=find_cart_ef

    respond_to do |format|
      format.html { redirect_to(list_opp_trs_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_to_cart_events
    @cart_ef=find_cart_ef
    list_opp_tr=ListOppTr.find(params[:id])
    @current_item=@cart_ef.add_opp_tr(list_opp_tr)
    respond_to {|format| format.js}
  end
  
  def empty_cart_events
    session[:cart_ef] = nil
    flash[:notice] = "Ви очистили список"
    redirect_to :action => :index
  end
  
  def redirect_to_index(msg =nil)
    flash[:notice]=msg if msg
    redirect_to :action => :index
  end
  
  def checkout
    @cart_ef=find_cart_ef
    if @cart_ef.item_ots.empty?
      redirect_to_index("Cписок Можливостей/Загроз пустий!!!")
    else
      if @cart_ef.item_sws.empty?
      redirect_to_index("Cписок Сильних/Слабих сторін пустий!!!")
      else
        @swot=Swot.new
      end
    end
  end
  
  def save_swot
    @cart_ef = find_cart_ef
    @swot = Swot.new(params[:swot]) 
    @swot.add_matrix_items_from_cart_ef(@cart_ef) 
    if @swot.save                     
      session[:cart_ef] = nil
      redirect_to_index("Thank you for your SWOT")
    else
      render :action => 'checkout'
    end
  end
  
  
private

  def find_cart_ef
    session[:cart_ef] ||= CartEf.new
  end  
  
end

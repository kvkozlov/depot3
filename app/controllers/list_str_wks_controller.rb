class ListStrWksController < ApplicationController
  # GET /list_str_wks
  # GET /list_str_wks.xml
  def index
    @list_str_wks = ListStrWk.find(:all,:order => "name")
    @cart_ef=find_cart_ef
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @list_str_wks }
    end
  end

  # GET /list_str_wks/1
  # GET /list_str_wks/1.xml
  def show
    @list_str_wk = ListStrWk.find(params[:id])
    @cart_ef=find_cart_ef
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list_str_wk }
    end
  end

  # GET /list_str_wks/new
  # GET /list_str_wks/new.xml
  def new
    @list_str_wk = ListStrWk.new
    @cart_ef=find_cart_ef
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list_str_wk }
    end
  end

  # GET /list_str_wks/1/edit
  def edit
    @list_str_wk = ListStrWk.find(params[:id])
    @cart_ef=find_cart_ef
  end

  # POST /list_str_wks
  # POST /list_str_wks.xml
  def create
    @list_str_wk = ListStrWk.new(params[:list_str_wk])
    @cart_ef=find_cart_ef
    respond_to do |format|
      if @list_str_wk.save
        flash[:notice] = 'ListStrWk was successfully created.'
        format.html { redirect_to(@list_str_wk) }
        format.xml  { render :xml => @list_str_wk, :status => :created, :location => @list_str_wk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list_str_wk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /list_str_wks/1
  # PUT /list_str_wks/1.xml
  def update
    @list_str_wk = ListStrWk.find(params[:id])
    @cart_ef=find_cart_ef
    respond_to do |format|
      if @list_str_wk.update_attributes(params[:list_str_wk])
        flash[:notice] = 'ListStrWk was successfully updated.'
        format.html { redirect_to(@list_str_wk) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list_str_wk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /list_str_wks/1
  # DELETE /list_str_wks/1.xml
  def destroy
    @list_str_wk = ListStrWk.find(params[:id])
    @list_str_wk.destroy
    @cart_ef=find_cart_ef
    respond_to do |format|
      format.html { redirect_to(list_str_wks_url) }
      format.xml  { head :ok }
    end
  end
  
  def add_to_cart_features
    @cart_ef=find_cart_ef
    list_str_wk=ListStrWk.find(params[:id])
    @current_item=@cart_ef.add_str_wk(list_str_wk)
    respond_to {|format| format.js}
  end
  
  def empty_cart_features
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

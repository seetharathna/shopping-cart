class PurchaseDetailsController < ApplicationController
include ActiveMerchant::Billing
  layout 'main'
  # GET /purchase_details
  # GET /purchase_details.xml
  def index
    @purchase_details = PurchaseDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @purchase_details }
    end
  end

  # GET /purchase_details/1
  # GET /purchase_details/1.xml
  def show
    @purchase_detail = PurchaseDetail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @purchase_detail }
    end
  end

  # GET /purchase_details/new
  # GET /purchase_details/new.xml
  def new
    @purchase_detail = PurchaseDetail.new
    @guide = Guide.find(params[:guide])
    


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @purchase_detail }
    end
  end

  # GET /purchase_details/1/edit
  def edit
    @purchase_detail = PurchaseDetail.find(params[:id])
  end

  # POST /purchase_details
  # POST /purchase_details.xml
  def create
    @purchase_detail = PurchaseDetail.new(params[:purchase_detail])
    @purchase_detail.guide_id = params[:guide_id]
    
    respond_to do |format|
      if @purchase_detail.save
        session[:id] = @purchase_detail.id
        flash[:notice] = 'PurchaseDetail was successfully created.'
        format.html { redirect_to(order_purchase_details_path(:guide_id => params[:guide_id])) }
        format.xml  { render :xml => @purchase_detail, :status => :created, :location => @purchase_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @purchase_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_details/1
  # PUT /purchase_details/1.xml
  def update
    @purchase_detail = PurchaseDetail.find(params[:id])

    respond_to do |format|
      if @purchase_detail.update_attributes(params[:purchase_detail])
        flash[:notice] = 'PurchaseDetail was successfully updated.'
        format.html { redirect_to(@purchase_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @purchase_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_details/1
  # DELETE /purchase_details/1.xml
  def destroy
    @purchase_detail = PurchaseDetail.find(params[:id])
    @purchase_detail.destroy

    respond_to do |format|
      format.html { redirect_to(purchase_details_url) }
      format.xml  { head :ok }
    end
  end

  def order
    @guide = Guide.find(params[:guide_id])
    @cost = @guide.price
  end


  def checkout
    setup_response = gateway.setup_purchase(5000,
      :ip                => request.remote_ip,
      :return_url        => url_for(:action => 'confirm', :only_path => false),
      :cancel_return_url => url_for(:action => 'order', :only_path => false)
    )
    redirect_to gateway.redirect_url_for(setup_response.token)
  end

  def confirm
    redirect_to :action => 'order' unless params[:token]
  
  details_response = gateway.details_for(params[:token])
  
  if !details_response.success?
    @message = details_response.message
    render :action => 'error'
    return
  end
    
  @address = details_response.address

  end

  def complete
     @purchase_detail_id = session[:id]
     @buyer = PurchaseDetail.find(@purchase_detail_id)
     purchase = gateway.purchase(5000,
    :ip       => request.remote_ip,
    :payer_id => params[:payer_id],
    :token    => params[:token]
  )
  
  if !purchase.success?
    @message = purchase.message
    render :action => 'error'
    return
  else
   UserMailer.deliver_order(@buyer)
  end
 end

private
  def gateway
    @gateway ||= PaypalExpressGateway.new(
      :login => 'vijend_1231746425_biz_api1.gmail.com',
      :password => '1231746436',
      :signature => 'A0FGgDA3jt02W1NtVzMesB3rWRzWAnZ6H2v0p1UmtLtZ0jOHnn3wJtXQ'
    )
  end

end

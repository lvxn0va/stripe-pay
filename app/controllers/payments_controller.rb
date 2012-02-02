class PaymentsController < ApplicationController
  
  def thankyou
    
  end
  
  # GET /payments
  def index
    @payments = Payment.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /payments/1
  def show
    @payment = Payment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /payments/new
  def new
    @payment = Payment.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /payments/1/edit
  def edit
    @payment = Payment.find(params[:id])
  end

  # POST /payments
  def create
    @payment = Payment.new(params[:payment])
    respond_to do |format|
      if @payment.save_with_payment
        format.html { redirect_to thankyou_path }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /payments/1
  def update
    @payment = Payment.find(params[:id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /payments/1
  # DELETE /payments/1.json
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url }
    end
  end
end
